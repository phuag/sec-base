package com.phuag.sample.common.security.component;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * @author phuag
 */
@Configuration
@ConfigurationProperties(prefix = "jwt")
@Data
public class JwtProperties {

	private String secretKey = "secret";

	//validity in milliseconds
	private long validityInMs = 3600000; // 1h
}
