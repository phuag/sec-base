package com.phuag.sample.auth.controller;

import com.phuag.sample.common.config.ApiErrors;
import com.phuag.sample.common.model.ResponseMessage;
import com.phuag.sample.common.enums.ResultEnum;
import com.phuag.sample.common.exception.InnerException;
import com.phuag.sample.common.exception.InvalidRequestException;
import com.phuag.sample.common.exception.ResourceNotFoundException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import javax.annotation.Resource;
import java.net.ConnectException;
import java.util.List;

/**
 * Called when an exception occurs during request processing. Transforms exception message into JSON format.
 * @author vvvvvv
 */
//@ControllerAdvice(annotations = RestController.class)
public class RestExceptionHandler extends ResponseEntityExceptionHandler {

    private static final Logger log = LoggerFactory.getLogger(RestExceptionHandler.class);

    @Resource
    private MessageSource messageSource;

    @ExceptionHandler(value = {Exception.class, RuntimeException.class})
    @ResponseBody
    public ResponseEntity<ResponseMessage> handleGenericException(Exception ex, WebRequest request) {
        if (log.isDebugEnabled()) {
            log.debug("handling exception...");
            ex.printStackTrace();
        }
        String message =  ex.getMessage();
        if(ex instanceof  ConnectException){
            message = ResultEnum.SERVICE_CONNECT_FAIL.getMsg();
        }
        return new ResponseEntity<>(new ResponseMessage(ResponseMessage.Type.error,message), HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(value = {ResourceNotFoundException.class})
    @ResponseBody
    public ResponseEntity<ResponseMessage> handleResourceNotFoundException(ResourceNotFoundException ex, WebRequest request) {
        if (log.isDebugEnabled()) {
            log.debug("handling ResourceNotFoundException...");
        }
        return new ResponseEntity<ResponseMessage>(HttpStatus.NOT_FOUND);
    }
    @ExceptionHandler(value = {InnerException.class})
    @ResponseBody
    public ResponseEntity<ResponseMessage> handleCetc30Exception(InnerException ex, WebRequest request) {
        if (log.isDebugEnabled()) {
            log.debug("handling InnerException...");
            ex.printStackTrace();
        }
        ResponseMessage responseMessage = ResponseMessage.error(ex.getMessage());
        return new ResponseEntity<ResponseMessage>(responseMessage,HttpStatus.OK);
    }

    @ExceptionHandler(value = {InvalidRequestException.class})
    public ResponseEntity<ResponseMessage> handleInvalidRequestException(InvalidRequestException ex, WebRequest req) {
        if (log.isDebugEnabled()) {
            log.debug("handling InvalidRequestException...");
        }

        ResponseMessage alert = new ResponseMessage(
            ResponseMessage.Type.danger,
            ApiErrors.INVALID_REQUEST,
            messageSource.getMessage(ApiErrors.INVALID_REQUEST, new String[]{}, null));

        BindingResult result = ex.getErrors();

        List<FieldError> fieldErrors = result.getFieldErrors();

        if (!fieldErrors.isEmpty()) {
            for (FieldError e :fieldErrors){
                alert.addError(e.getField(), e.getCode(), e.getDefaultMessage());
            }
            fieldErrors.stream().forEach((e) -> {
                alert.addError(e.getField(), e.getCode(), e.getDefaultMessage());
            });
        }

        return new ResponseEntity<ResponseMessage>(alert, HttpStatus.UNPROCESSABLE_ENTITY);
    }

}
