package com.servicemycar.gateway;

import com.servicemycar.gateway.config.AuthorizationFilter;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class GatewayServiceApplication {

	public static void main(String[] args) {
		SpringApplication.run(GatewayServiceApplication.class, args);
	}

	@Bean
	public RouteLocator customRouteLocator(RouteLocatorBuilder builder) {
		return builder.routes()
				.route("booking-service", r -> r.path("/bookings/**")
						.filters(f -> f.filter(new AuthorizationFilter()))
						.uri("http://localhost:2021/bookings/"))
				.route("user-service", r -> r.path("/users/**")
						.uri("http://localhost:2022/users/"))
				.build();
	}
}
