package com.servicemycar.notification.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.Map;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class EmailDetails {
    private String recipient;
    private List<String> recipients;
    private String msgBody;
    private String subject;
    private String attachment;
    private String templateName;
    private Map<String, String> variables;
}