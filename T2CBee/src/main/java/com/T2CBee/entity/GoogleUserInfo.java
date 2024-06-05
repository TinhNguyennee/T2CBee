package com.T2CBee.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class GoogleUserInfo {
    private String id;
    private String email;

    @JsonProperty("verified_email")
    private boolean verifiedEmail;

    private String picture;
    private String hd;
}
