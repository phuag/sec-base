package com.phuag.sample.common.core.util;

import cn.hutool.core.codec.Base64;
import com.phuag.sample.common.core.exception.CheckedException;
import lombok.SneakyThrows;
import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.nio.charset.StandardCharsets;
import java.util.Enumeration;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Created by vvvvvv on 2017/12/7.
 */
@Slf4j
@UtilityClass
public class WebUtils extends org.springframework.web.util.WebUtils {
    private final String BASIC_ = "Basic ";
    private static final String[] IP_HEADERS = {"X-Forwarded-For",
            "Proxy-Client-IP", "WL-Proxy-Client-IP", "X-Real-IP"};

    public static HttpServletRequest getHttpServletRequest() {
        try {
            return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        } catch (Exception e) {
            return null;
        }

    }

    public static Map<String, String> getHeaders(HttpServletRequest request) {
        Map<String, String> map = new LinkedHashMap<>();
        Enumeration<String> enumeration = request.getHeaderNames();
        while (enumeration.hasMoreElements()) {
            String key = enumeration.nextElement();
            String value = request.getHeader(key);
            map.put(key, value);
        }
        return map;
    }

    public static String getIpAddr(HttpServletRequest request) {
        for (String ipHeader : IP_HEADERS) {
            String ip = request.getHeader(ipHeader);
            if (!StringUtils.isEmpty(ip) && !ip.contains("unknown")) {
                return ip;
            }
        }
        return request.getRemoteAddr();
    }

    /**
     * 获取当前请求对象
     *
     * @return
     */
    public static HttpServletRequest getRequest() {
        try {
            return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * 获取 HttpServletResponse
     *
     * @return {HttpServletResponse}
     */
    public HttpServletResponse getResponse() {
        return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getResponse();
    }

    /**
     * 从request 获取CLIENT_ID
     *
     * @return
     */
    @SneakyThrows
    public String[] getClientId(ServerHttpRequest request) {
        String header = request.getHeaders().getFirst(HttpHeaders.AUTHORIZATION);

        if (header == null || !header.startsWith(BASIC_)) {
            throw new CheckedException("请求头中client信息为空");
        }
        byte[] base64Token = header.substring(6).getBytes("UTF-8");
        byte[] decoded;
        try {
            decoded = Base64.decode(base64Token);
        } catch (IllegalArgumentException e) {
            throw new CheckedException(
                    "Failed to decode basic authentication token");
        }

        String token = new String(decoded, StandardCharsets.UTF_8);

        int delim = token.indexOf(":");

        if (delim == -1) {
            throw new CheckedException("Invalid basic authentication token");
        }
        return new String[]{token.substring(0, delim), token.substring(delim + 1)};
    }
}
