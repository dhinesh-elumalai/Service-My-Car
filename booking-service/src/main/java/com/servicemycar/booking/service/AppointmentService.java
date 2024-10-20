package com.servicemycar.booking.service;

import com.servicemycar.booking.common.Constants;
import com.servicemycar.booking.dto.EmailDetails;
import com.servicemycar.booking.dto.UserResponse;
import com.servicemycar.booking.entity.Appointment;
import com.servicemycar.booking.entity.Quotation;
import com.servicemycar.booking.exception.BookingException;
import com.servicemycar.booking.feign.NotificationFeignClient;
import com.servicemycar.booking.feign.UsersFeignClient;
import com.servicemycar.booking.repo.AppointmentRepository;
import com.servicemycar.booking.repo.CarRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;

@Service
@Slf4j
public class AppointmentService {

    @Autowired
    private AppointmentRepository appointmentRepository;

    @Autowired
    private UsersFeignClient usersClient;

    @Autowired
    private NotificationFeignClient notificationFeignClient;

    @Autowired
    private CarRepository carRepository;

    @Autowired
    private ServiceCenterService serviceCenterService;

    /**
     * @param appointment
     * @return
     */
    public Appointment createAppointment(Appointment appointment) {
        return appointmentRepository.save(appointment);
    }

    /**
     * @return
     */
    public List<Appointment> getAllAppointments() {
        return appointmentRepository.findAll();
    }

    /**
     * @return
     */
    public List<Appointment> getAppointmentByUsername(String username) {
        return appointmentRepository.findByUsername(username);
    }

    /**
     * @return
     */
    public List<Appointment> getAppointmentsByServiceCenterId(String serviceCenterId) {
        return appointmentRepository.findByServiceCenterUsername(serviceCenterId);
    }

    /**
     * @return
     */
    public Appointment getAppointmentById(long appointmentId) {
        return appointmentRepository.findById(appointmentId).get();
    }

    /**
     * @return
     */
    public String deleteAppointmentById(long appointmentId) {
        Optional<Appointment> appointmentOptional = appointmentRepository.findById(appointmentId);
        if (appointmentOptional.isEmpty())
            throw new BookingException(HttpStatus.BAD_REQUEST, "Invalid Appointment Id");
        appointmentRepository.deleteById(appointmentId);
        return "Appointment with id " + appointmentId + " is deleted successfully!";
    }


    /**
     * @return
     */
    public String updateAppointment(long appointmentId, Boolean isConfirmed, Boolean isCompleted) {
        Optional<Appointment> appointmentOptional = appointmentRepository.findById(appointmentId);
        if (appointmentOptional.isEmpty())
            throw new BookingException(HttpStatus.BAD_REQUEST, "Invalid Appointment Id");
        var appointment = appointmentOptional.get();
        if (isCompleted != null) {
            appointment.setCompleted(isCompleted);
        }
        if (isConfirmed != null) {
            appointment.setConfirmed(isConfirmed);
        }
        Appointment appointmentSaved = appointmentRepository.save(appointment);

        if(isConfirmed != null && appointmentSaved.isConfirmed()){
            notifyUserOnAppointmentConfirmation(appointmentSaved);
        }
        notifyUserOnAppointmentConfirmation(appointment);
        return "Appointment with id " + appointmentId + " is updated successfully!";
    }

    /**
     *
     */
    public void notifyUserOnAppointmentConfirmation(Appointment appointment) {
        try {
            var userResponse = usersClient.getUserByUsername(appointment.getUsername());
            UserResponse user = null;
            if (userResponse.getStatusCode().is2xxSuccessful()) {
                user = Objects.requireNonNull(userResponse.getBody()).getData();

            } else {
                return;
            }
            var carOptional = carRepository.findByUsername(user.getEmail());
            String carModel = "Unknown";
            if(carOptional.isPresent()){
                carModel = carOptional.get().getModel();
            }
            // Prepare email variables
            Map<String, String> emailVariables = new HashMap<>();
            emailVariables.put("${userName}", user.getName());
            emailVariables.put("${appointmentFrom}", getDateInFormat(appointment.getFromTime()));
            emailVariables.put("${appointmentTo}", getDateInFormat(appointment.getToTime()));
            emailVariables.put("${carModel}", carModel);
            emailVariables.put("${appointmentLink}", "http://localhost:3000/app/appointments");
            emailVariables.put("${currentYear}", String.valueOf(Calendar.getInstance().get(Calendar.YEAR)));
            emailVariables.put("${contactEmail}", "servicemycar12345@gmail.com");
            emailVariables.put("${serviceCenter}", appointment.getServiceCenterUsername());
            // Create EmailDetails object
            EmailDetails emailDetails = EmailDetails.builder()
                    .recipients(Collections.singletonList(user.getEmail()))
                    .variables(emailVariables).subject("Appointment Confirmed!")
                    .templateName(Constants.APPOINTMENT_CONFIRMATION_TEMPLATE).build();
            // Call notification service to send email
            log.info("Calling notification service to send the email with details {}", emailDetails);
            notificationFeignClient.sendEmailFromTemplate(emailDetails);
        } catch (Exception exception) {
            log.error("Error occurred while sending email to user: {}", exception.getMessage(), exception);
        }
    }

    public String getDateInFormat(long timeInMillis) {
        SimpleDateFormat formatter = new SimpleDateFormat("MMMM dd, yyyy 'at' hh:mm a");
        try {
            return formatter.format(new Date(timeInMillis));
        } catch (Exception exception) {
            return formatter.format(new Date());
        }
    }
}
