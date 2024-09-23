package com.servicemycar.booking.service;

import com.servicemycar.booking.entity.Quotation;
import com.servicemycar.booking.exception.BookingException;
import com.servicemycar.booking.repo.QuotationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class QuotationService {

    @Autowired
    private QuotationRepository quotationRepository;

    /**
     * @param quotation
     * @return
     */
    public Quotation createQuotation(Quotation quotation) {
        return quotationRepository.save(quotation);
    }

    /**
     * @return
     */
    public List<Quotation> getAllQuotations() {
        return quotationRepository.findAll();
    }

    /**
     * @return
     */
    public List<Quotation> getQuotationByUserId(int userId) {
        return quotationRepository.findByRequestedUserId(userId);
    }


    /**
     * @return
     */
    public List<Quotation> getQuotationByServiceCenter(int serviceCenterId) {
        return quotationRepository.findByServiceCenterId(serviceCenterId);
    }

    /**
     * @return
     */
    public Quotation getQuotationById(long quotationId) {
        return quotationRepository.findById(quotationId).get();
    }

    /**
     * @return
     */
    public String deleteQuotationById(long quotationId) {
        quotationRepository.deleteById(quotationId);
        return "Quotation with id " + quotationId + " is deleted successfully!";
    }

}
