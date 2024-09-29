package com.servicemycar.notification.service.impl;


import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import com.servicemycar.notification.model.EmailDetails;
import com.servicemycar.notification.service.EmailService;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class EmailServiceImpl implements EmailService {

    @Autowired
    private JavaMailSender javaMailSender;

    @Value("${from.email.address}")
    private String sender;

    /**
     *
     * @param details
     * @return
     */
    public String sendMailWithAttachment(EmailDetails details) {
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        MimeMessageHelper mimeMessageHelper;
        try {
            mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
            mimeMessageHelper.setFrom(sender);
            mimeMessageHelper.setTo(details.getRecipient());
            mimeMessageHelper.setText(details.getMsgBody());
            mimeMessageHelper.setSubject(details.getSubject());
            FileSystemResource file = new FileSystemResource(new File(details.getAttachment()));
            mimeMessageHelper.addAttachment(Objects.requireNonNull(file.getFilename()), file);
            javaMailSender.send(mimeMessage);
            return "Mail sent Successfully";
        } catch (MessagingException e) {
            return "Error while sending mail!!!";
        }
    }

    /**
     *
     * @param recipients
     * @param subject
     * @throws MessagingException
     */
    public void sendEmailFromText(String recipients, String subject, String content) {
        MimeMessage message = javaMailSender.createMimeMessage();
        try {
            log.info("Received request to send a mail with details , recipients : {} , subject : {}, content : {}", recipients, subject, content);
            message.setFrom(sender);
            message.setRecipients(MimeMessage.RecipientType.TO, recipients);
            message.setSubject(subject);
            message.setContent(content, "text/html; charset=utf-8");
            javaMailSender.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }


    /**
     *
     * @param recipients
     * @param subject
     * @param htmlTemplateName
     * @param variables
     * @throws MessagingException
     */
    public void sendEmailFromTemplate(String recipients, String subject, String htmlTemplateName,
                                      Map<String, String> variables) {
        MimeMessage message = javaMailSender.createMimeMessage();
        try {
            message.setFrom(sender);
            message.setRecipients(MimeMessage.RecipientType.TO, recipients);
            message.setSubject(subject);
            String htmlTemplate = readFile(htmlTemplateName);
            for (String key : variables.keySet()) {
                htmlTemplate = htmlTemplate.replace(key, variables.get(key));
            }
            message.setContent(htmlTemplate, "text/html; charset=utf-8");
            javaMailSender.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    private String readFile(String fileClassPath){
        try {
            return new String(Objects.requireNonNull(getClass().getResourceAsStream("templates/" +fileClassPath)).readAllBytes());
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}