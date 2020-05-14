package com.phuag.sample.common.logging;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.lang.reflect.Method;
import java.util.Map;

/**
 *
 * @author vvvvvv
 * @date 2017/12/6
 */
@Data
@NoArgsConstructor
@ToString
public class AccessLogInfo {

    private String id;
    private String module;
    private String action;
    private String describe;
    private Method method;
    private Class target;
    private Map<String,Object> parameters;
    private String ip;
    private String url;
    private Map<String,String> httpHeaders;
    private String httpMethod;
    private Object response;
    private long requestTime;
    private long responseTime;
    private Throwable excepion;
    private String operUserId;
    private String operUserName;

}
