package com.servicemycar.notification.service;

import com.servicemycar.notification.dto.BreakDownAlert;
import com.servicemycar.notification.model.EmailDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NotificationService {

    @Autowired
    private EmailService emailService;

    private final static String BREAK_DOWN_ALERT_TEXT="Dear Seller, " +
            "A car of model : ${model} is stuck nearby your area and requires your help. Please reach out to Mr / Mrs : ${customerName} via email : ${email} or mobile : ${mobile} to help further.";

    /**
     *
     * @param breakDownAlert Break down Alert Details
     */
    public void sendBreakDownAlert(BreakDownAlert breakDownAlert){
        String recipients = String.join(",", breakDownAlert.getRecipients());
        String content = BREAK_DOWN_ALERT_TEXT
                .replace("${model}", breakDownAlert.getCarModel())
                .replace("${customerName}", breakDownAlert.getName())
                .replace("${email}", breakDownAlert.getEmail())
                .replace("${mobile}", breakDownAlert.getMobile());
       emailService.sendEmailFromText(recipients, "Car Breakdown Alert", content);
    }


    /**
     *
     * @param emailDetails Email Details
     */
    public void sendEmail(EmailDetails emailDetails){
        String recipients = String.join(",", emailDetails.getRecipients());
        emailService.sendEmailFromText(recipients, emailDetails.getSubject(), emailDetails.getMsgBody());
    }

}
