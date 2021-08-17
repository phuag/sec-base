package com.phuag.ds.common.exceptions;


/**
 * Map inner exception to ui message
 * @author davidhua
 * 2019/1/16
 */
public class EndPointException extends RuntimeException{
    private String uiMessage;
    private Object[] args;
    public EndPointException(String uiMessage, String message, Throwable throwable){
        super(message, throwable);
        this.uiMessage = uiMessage;
    }
    public EndPointException(String uiMessage, Throwable throwable,Object...args){
        super(throwable);
        if(args != null && args.length > 0){
            this.args = args;
        }
        this.uiMessage = uiMessage;
    }
    public String getUiMessage(){
        return this.uiMessage;
    }
    public Object[] getArgs(){
        return this.args;
    }
}
