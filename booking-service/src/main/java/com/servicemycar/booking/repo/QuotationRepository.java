package com.servicemycar.booking.repo;

import com.servicemycar.booking.entity.Quotation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuotationRepository extends JpaRepository<Quotation, Long> {

    List<Quotation> findByUsername(String username);

    List<Quotation> findByServiceCenterId(int serviceCenterId);
}
