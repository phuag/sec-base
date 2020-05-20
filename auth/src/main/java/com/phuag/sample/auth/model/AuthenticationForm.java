package com.phuag.sample.auth.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author phuag
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AuthenticationForm {
    private String username;
    private String password;
}
