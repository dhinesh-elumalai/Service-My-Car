package com.servicemycar.booking.service;

import com.servicemycar.booking.common.Constants;
import com.servicemycar.booking.dto.EmailDetails;
import com.servicemycar.booking.dto.QuotationRequest;
import com.servicemycar.booking.dto.UserResponse;
import com.servicemycar.booking.entity.CarData;
import com.servicemycar.booking.entity.Quotation;
import com.servicemycar.booking.entity.ServiceCenter;
import com.servicemycar.booking.exception.BookingException;
import com.servicemycar.booking.feign.NotificationFeignClient;
import com.servicemycar.booking.feign.UsersFeignClient;
import com.servicemycar.booking.repo.QuotationRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
@Slf4j
public class QuotationService {

    @Autowired
    private QuotationRepository quotationRepository;

    @Autowired
    private CarService carService;

    @Autowired
    private ServiceCenterService serviceCenterService;

    @Autowired
    private UsersFeignClient usersFeignClient;

    @Autowired
    private NotificationFeignClient notificationFeignClient;

    /**
     * @param quotation Quotation
     * @return Quotation
     */
    public Quotation createQuotation(Quotation quotation) {
        notifyUserOnNewQuote(quotation);
        return quotationRepository.save(quotation);
    }

    /**
     * @return List<Quotation>
     */
    public List<Quotation> getAllQuotations() {
        return quotationRepository.findAll();
    }

    /**
     * @return List<Quotation>
     */
    public List<Quotation> getQuotationByUsername(String username) {
        return quotationRepository.findByUsername(username);
    }


    /**
     * @return List<Quotation>
     */
    public List<Quotation> getQuotationByServiceCenter(int serviceCenterId) {
        return quotationRepository.findByServiceCenterId(serviceCenterId);
    }

    /**
     * @return Quotation
     */
    public Quotation getQuotationById(long quotationId) {
        return quotationRepository.findById(quotationId).get();
    }

    /**
     * @return String
     */
    public String deleteQuotationById(long quotationId) {
        quotationRepository.deleteById(quotationId);
        return "Quotation with id " + quotationId + " is deleted successfully!";
    }

    /**
     * Method to request quotation from sellers
     *
     * @param quotationRequest QuotationRequest
     */
    public String requestQuotation(QuotationRequest quotationRequest) {
        var userResponse = usersFeignClient.getUserByUsername(quotationRequest.getUsername());
        UserResponse user = null;
        if (userResponse.getStatusCode().is2xxSuccessful()) {
            user = Objects.requireNonNull(userResponse.getBody()).getData();
        } else {
            throw new BookingException(HttpStatus.BAD_REQUEST, "Invalid User Id!!");
        }
        CarData car = carService.getCarByUsername(quotationRequest.getUsername());
        List<ServiceCenter> serviceCenters = serviceCenterService.getServiceCentersByCity(quotationRequest.getCity());
        if (serviceCenters.isEmpty()) {
            throw new BookingException(HttpStatus.BAD_REQUEST, "No service centers available in the selected city");
        }
        Map<String, String> emailVariables = new HashMap<>();
        emailVariables.put("${userName}", user.getName());
        emailVariables.put("${carModel}", car.getModel());
        emailVariables.put("${email}", user.getEmail());
        emailVariables.put("${phone}", user.getPhone());
        emailVariables.put("${issue}", quotationRequest.getIssue());
        EmailDetails emailDetails = EmailDetails.builder()
                .recipients(serviceCenters.stream().map(ServiceCenter::getCity).toList())
                .variables(emailVariables)
                .subject("Service Quotation Request")
                .templateName(Constants.QUOTATION_REQUEST_TEMPLATE)
                .build();
        notificationFeignClient.sendEmailFromTemplate(emailDetails);
        return "Success";
    }

    public void notifyUserOnNewQuote(Quotation quotation) {
        try {
            // Fetch user details using userId from the quotation
            var userResponse = usersFeignClient.getUserByUsername(quotation.getUsername());
            UserResponse user = null;
            if (userResponse.getStatusCode().is2xxSuccessful()) {
                user = Objects.requireNonNull(userResponse.getBody()).getData();
            }
            // Prepare email variables
            Map<String, String> emailVariables = new HashMap<>();
            emailVariables.put("${userName}", user.getName());
            emailVariables.put("${carModel}", quotation.getCarModel());
            emailVariables.put("${quotationAmount}", quotation.getTotalPrice());
            emailVariables.put("${serviceDetails}", quotation.getDescription());
            // Create EmailDetails object
            EmailDetails emailDetails = EmailDetails.builder()
                    .recipients(Collections.singletonList(user.getEmail()))
                    .variables(emailVariables)
                    .subject("New Quotation Received")
                    .templateName(Constants.QUOTATION_RESPONSE_TEMPLATE)
                    .build();
            // Call notification service to send email
            notificationFeignClient.sendEmailFromTemplate(emailDetails);
        } catch (Exception exception) {
            log.info("Error occurred while sending email to user: " + exception.getMessage());
        }
    }
}
