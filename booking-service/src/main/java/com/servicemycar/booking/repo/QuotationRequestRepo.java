package com.servicemycar.booking.repo;

import com.servicemycar.booking.entity.QuotationRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface QuotationRequestRepo extends JpaRepository<QuotationRequest, Integer> {
}
