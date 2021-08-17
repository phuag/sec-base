package com.phuag.ds.common.exceptions;

/**
 * Exception transferred between different models or structures
 * @author davidhua
 * 2019/1/16
 */
public class DataAccessException extends RuntimeException{
    public DataAccessException(Throwable cause) {
        super(cause);
    }
    public DataAccessException(String message, Throwable cause){
        super(message, cause);
    }
}
