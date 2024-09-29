package com.servicemycar.booking;

import com.servicemycar.booking.entity.Appointment;
import com.servicemycar.booking.entity.CarData;
import com.servicemycar.booking.entity.Quotation;
import com.servicemycar.booking.entity.ServiceCenter;
import com.servicemycar.booking.repo.AppointmentRepository;
import com.servicemycar.booking.repo.CarRepository;
import com.servicemycar.booking.repo.QuotationRepository;
import com.servicemycar.booking.repo.ServiceCenterRepository;
import jakarta.annotation.PostConstruct;
import jakarta.persistence.Cache;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Arrays;

@SpringBootApplication
@EnableFeignClients
public class BookingServiceApplication {

	public static void main(String[] args) {
		SpringApplication.run(BookingServiceApplication.class, args);
	}

	@Autowired
	private ServiceCenterRepository serviceCenterRepository;

	@Autowired
	private AppointmentRepository appointmentRepository;

	@Autowired
	private QuotationRepository quotationRepository;
	@Autowired
	private CarRepository carRepository;

	@PostConstruct
	public void insertData(){
		ServiceCenter center1 = new ServiceCenter(1001, "Garuda Automobiles", "aishwaryanew9@gmail.com", "1234567890", "123 Main St", "Chennai", 12.34, 56.78, 4.5);
		ServiceCenter center2 = new ServiceCenter(1002, "King Automobiles", "kingmotors@gmail.com", "0987654321", "456 Elm St", "Villupuram", 23.45, 67.89, 4.0);
		ServiceCenter center3 = new ServiceCenter(1003, "Panda Motors", "pandamotors@gmail.com", "1122334455", "789 Oak St", "Coimbatore", 34.56, 78.90, 3.5);
		ServiceCenter center4 = new ServiceCenter(1004, "King Kong Motors", "aishwaryanew9@gmail.com", "1122335455", "789 Oak St", "Villupuram", 34.56, 78.90, 3.5);
		serviceCenterRepository.saveAll(Arrays.asList(center1, center2, center3, center4));

		Appointment appointment1 = new Appointment(1001, "aishwaryanew7@gmail.com", "aishwaryanew9@gmail.com", System.currentTimeMillis() , System.currentTimeMillis() + 10000, true, true);
		Appointment appointment2 = new Appointment(1002, "aishwaryanew8@gmail.com", "aishwaryanew9@gmail.com", System.currentTimeMillis() , System.currentTimeMillis() + 10000, true, true);
		Appointment appointment3 = new Appointment(1003, "aishwaryanew7@gmail.com", "aishwaryanew9@gmail.com", System.currentTimeMillis() , System.currentTimeMillis() + 1000099, false, true);
		Appointment appointment4 = new Appointment(1004, "aishwaryanew8@gmail.com", "aishwaryanew9@gmail.com", System.currentTimeMillis() , System.currentTimeMillis() + 10000, true, false);
		Appointment appointment5 = new Appointment(1005, "aishwaryanew7@gmail.com", "aishwaryanew9@gmail.com", System.currentTimeMillis() , System.currentTimeMillis() + 10000, true, true);

		appointmentRepository.saveAll(Arrays.asList(appointment1, appointment2, appointment3, appointment4, appointment5));

		Quotation quotation1 = new Quotation(1001, "Car Door Change required", "Suzuki Alto 800", "Door", "aishwaryanew9@gmail.com", "10000 Rs", "aishwaryanew7@gmail.com");
		Quotation quotation2 = new Quotation(1002, "Engine Oil Change", "Suzuki Alto 800", "Engine Oil", "aishwaryanew9@gmail.com", "10000 Rs", "aishwaryanew7@gmail.com");
		Quotation quotation3 = new Quotation(1003, "Engine Wire corruption", "Mahindra Thor", "Service", "aishwaryanew9@gmail.com", "10000 Rs", "aishwaryanew8@gmail.com");
		Quotation quotation4 = new Quotation(1004, "Software issue", "Suzuki Alto 800", "Door", "aishwaryanew9@gmail.com", "10000 Rs", "aishwaryanew7@gmail.com");
		Quotation quotation5 = new Quotation(1005, "Engine Oil Change", "Mahindra Thor", "Door", "aishwaryanew9@gmail.com", "10000 Rs", "aishwaryanew8@gmail.com");

		quotationRepository.saveAll(Arrays.asList(quotation1, quotation2, quotation3, quotation4, quotation5));

		CarData car1 = new CarData(1001, "Alto 800", "Maruti Suzuki", "2018", "Petrol", "aishwaryanew7@gmail.com");
		CarData car2 = new CarData(1001, "Thar 1600", "Mahindra", "2021", "Petrol", "aishwaryanew8@gmail.com");
		CarData car3 = new CarData(1001, "Scorpio 8000", "Mahindra", "2013", "Petrol", "aishwaryanew9@gmail.com");
		CarData car4 = new CarData(1001, "Baleno 600", "Maruti Suzuki", "2020", "Diesel", "aishwaryanew10@gmail.com");
		CarData car5 = new CarData(1001, "i20", "Hyundai", "2015", "Petrol", "aishwaryanew11@gmail.com");

		carRepository.saveAll(Arrays.asList(car1, car2, car3, car4, car5));
	}
}
