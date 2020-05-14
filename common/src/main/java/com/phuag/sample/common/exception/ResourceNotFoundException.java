
package com.phuag.sample.common.exception;


/**
 * @author Administrator
 */
public class ResourceNotFoundException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    private String id;

    public ResourceNotFoundException(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }
}
