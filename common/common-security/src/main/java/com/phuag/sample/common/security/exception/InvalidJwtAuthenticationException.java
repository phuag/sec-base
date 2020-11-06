package com.phuag.sample.common.security.exception;

import org.springframework.security.core.AuthenticationException;

/**
 * @author phuag
 */
public class InvalidJwtAuthenticationException extends AuthenticationException {
    /**
	 * 
	 */
	private static final long serialVersionUID = -761503632186596342L;

	public InvalidJwtAuthenticationException(String e) {
        super(e);
    }
}
