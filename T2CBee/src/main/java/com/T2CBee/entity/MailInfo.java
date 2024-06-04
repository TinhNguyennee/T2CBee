package com.T2CBee.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MailInfo {
    String from;
    String to;
    String[] cc;
    String[] bcc;
    String subject;
    String body;
    String[] attachments;
    public MailInfo(String to, String subject, String body) {
        this.from = "huanlcps28692@fpt.edu.vn";
        this.to = to;
        this.subject = subject;
        this.body = body;
    }

}
