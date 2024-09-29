package com.servicemycar.notification.service;

import com.servicemycar.notification.dto.BreakDownAlert;
import com.servicemycar.notification.model.EmailDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Map;

@Service
public class NotificationService {

    @Autowired
    private EmailService emailService;

    private final static String BREAK_DOWN_ALERT_TEXT="Dear Seller, " +
            "A car of model : ${model} is stuck nearby your area and requires your help. Please reach out to Mr / Mrs : ${customerName} via email : ${email} or mobile : ${mobile} to help further." +
            "\n Click ${locationLink}> here </a> for location details";


    /**
     *
     * @param breakDownAlert Break down Alert Details
     */
    public void sendBreakDownAlert(BreakDownAlert breakDownAlert){
        String recipients = String.join(",", breakDownAlert.getRecipients());
        String templateContent = getTemplateFromResources("breakdown-notification.html");
        String content = templateContent
                .replace("${model}", breakDownAlert.getCarModel())
                .replace("${customerName}", breakDownAlert.getName())
                .replace("${email}", breakDownAlert.getEmail())
                .replace("${locationLink}", breakDownAlert.getLocationLink())
                .replace("${mobile}", breakDownAlert.getMobile());
       emailService.sendEmailFromText(recipients, "Car Breakdown Alert", content);
    }


    /**
     *
     * @param emailDetails Break down Alert Details
     */
    public void sendEmailFromTemplate(EmailDetails emailDetails){
        String recipients = String.join(",", emailDetails.getRecipients());
        String templateContent = getTemplateFromResources(emailDetails.getTemplateName());
        for (Map.Entry<String, String> entry : emailDetails.getVariables().entrySet()) {
            templateContent = templateContent.replace(entry.getKey(), entry.getValue());
        }
        emailService.sendEmailFromText(recipients, emailDetails.getSubject(), templateContent);
    }

    /**
     *
     * @param emailDetails Email Details
     */
    public void sendEmail(EmailDetails emailDetails){
        String recipients = String.join(",", emailDetails.getRecipients());
        emailService.sendEmailFromText(recipients, emailDetails.getSubject(), emailDetails.getMsgBody());
    }

    /**
     * Read the template from resources
     * @param templateName Template Name
     * @return  Template Content
     */
    private String getTemplateFromResources(String templateName) {
        ClassPathResource resource = new ClassPathResource("templates/" + templateName);
        Path path;
        try {
            path = Paths.get(resource.getURI());
            return new String(Files.readAllBytes(path));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

}
