package com.phuag.sample.common.core.exception;

import org.springframework.validation.BindingResult;


/**
 * @author Administrator
 */
public class InvalidRequestException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    BindingResult errors;

    public InvalidRequestException(BindingResult errors) {
        this.errors = errors;
    }

    public BindingResult getErrors() {
        return this.errors;
    }
}
