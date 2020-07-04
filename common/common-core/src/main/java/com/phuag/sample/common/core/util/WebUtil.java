package com.phuag.sample.common.core.util;

import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Created by vvvvvv on 2017/12/7.
 */
public abstract class WebUtil {

    private static final String[] IP_HEADERS = {"X-Forwarded-For",
            "Proxy-Client-IP", "WL-Proxy-Client-IP", "X-Real-IP"};

    public static HttpServletRequest getHttpServletRequest() {
        try {
            return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        }catch (Exception e){
            return null;
        }

    }

    public static Map<String,String> getHeaders(HttpServletRequest request) {
        Map<String,String> map = new LinkedHashMap<>();
        Enumeration<String> enumeration = request.getHeaderNames();
        while (enumeration.hasMoreElements()){
            String key = enumeration.nextElement();
            String value = request.getHeader(key);
            map.put(key,value);
        }
        return map;
    }

    public static String getIpAddr(HttpServletRequest request) {
        for (String ipHeader :IP_HEADERS){
            String ip = request.getHeader(ipHeader);
            if(!StringUtils.isEmpty(ip) && !ip.contains("unknown")){
                return ip;
            }
        }
        return request.getRemoteAddr();
    }

    /**
     * 获取当前请求对象
     * @return
     */
    public static HttpServletRequest getRequest(){
        try{
            return ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
        }catch(Exception e){
            return null;
        }
    }
}
