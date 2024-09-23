package com.servicemycar.notification.service;

import com.servicemycar.notification.model.EmailDetails;

import java.util.Map;

public interface EmailService {

    void sendEmailFromText(String recipients, String subject, String content);

    String sendMailWithAttachment(EmailDetails details);

    void sendEmailFromTemplate(String recipients, String subject, String htmlTemplateName,
                                      Map<String, String> variables);
}