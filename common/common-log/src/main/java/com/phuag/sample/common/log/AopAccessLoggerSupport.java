package com.phuag.sample.common.log;

import com.phuag.sample.common.core.util.AopUtil;
import com.phuag.sample.common.core.util.ThreadLocalUtils;
import com.phuag.sample.common.log.aop.MethodInterceptorHolder;
import com.phuag.sample.common.log.config.AccessLoggerParser;
import com.phuag.sample.common.log.enums.SysLogType;
import com.phuag.sample.common.core.util.IdGen;
import com.phuag.sample.common.core.util.WebUtil;
import org.aopalliance.intercept.MethodInterceptor;
import org.springframework.aop.support.StaticMethodMatcherPointcutAdvisor;
import org.springframework.util.ClassUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/**
 * @author vvvvvv
 * @date 2017/12/6
 */
public class AopAccessLoggerSupport extends StaticMethodMatcherPointcutAdvisor {
    private final List<AccessLoggerListener> listeners = new ArrayList<>();
    private final List<AccessLoggerParser> loggerParsers = new ArrayList<>();

    public AopAccessLoggerSupport addListener(AccessLoggerListener loggerListener) {
        listeners.add(loggerListener);
        return this;
    }

    public AopAccessLoggerSupport addParser(AccessLoggerParser parser) {
        loggerParsers.add(parser);
        return this;
    }

    public AopAccessLoggerSupport() {
        setAdvice((MethodInterceptor) methodInvocation -> {
            MethodInterceptorHolder methodInterceptorHolder = MethodInterceptorHolder.create(methodInvocation);
            AccessLogInfo info = createLogger(methodInterceptorHolder);
            Object response;
            try {
                listeners.forEach(listeners -> listeners.onLogBefore(info));
                response = methodInvocation.proceed();
                info.setResponse(response);
                info.setResponseTime(System.currentTimeMillis());
            } catch (Throwable e) {
                info.setExcepion(e);
                info.setAction("异常");
                throw e;
            } finally {
                listeners.forEach(listeners -> listeners.onLogger(info));
            }
            return response;
        });
    }

    protected AccessLogInfo createLogger(MethodInterceptorHolder holder) {
        AccessLogInfo info = new AccessLogInfo();
        info.setId(IdGen.uuid());
        info.setRequestTime(System.currentTimeMillis());

        LoggerDefine define = loggerParsers.stream()
                .filter(parser -> parser.support(ClassUtils.getUserClass(holder.getTarget()), holder.getMethod()))
                .findAny()
                .map(parser -> parser.parse(holder))
                .orElse(null);
        if (define != null) {
            info.setModule(define.getModule());
            info.setDescribe(define.getDescribe());
            String type = define.getType();
            if (SysLogType.ACCESS.getValue().equals(type)) {
                info.setAction("访问");
            } else if (SysLogType.LOGIN.getValue().equals(type)) {
                info.setAction("登录");
            } else if (SysLogType.OPER.getValue().equals(type)) {
                info.setAction("操作");
            }
        }
        info.setParameters(holder.getArgs());
        info.setTarget(holder.getTarget().getClass());
        info.setMethod(holder.getMethod());

        HttpServletRequest request = WebUtil.getHttpServletRequest();
        if (request != null) {
            info.setHttpHeaders(WebUtil.getHeaders(request));
            info.setIp(WebUtil.getIpAddr(request));
            info.setHttpMethod(request.getMethod());
            info.setUrl(request.getRequestURL().toString());
        }
        String userId = ThreadLocalUtils.get(ThreadLocalUtils.USER_ID);
        String userName = ThreadLocalUtils.get(ThreadLocalUtils.USER_NAME);
        info.setOperUserId(userId);
        info.setOperUserName(userName);
        return info;

    }

    @Override
    public boolean matches(Method method, Class<?> aClass) {
        AccessLogger ann = AopUtil.findAnnotation(aClass, method, AccessLogger.class);
        if (ann != null && ann.ignore()) {
            return false;
        }
        RequestMapping mapping = AopUtil.findAnnotation(aClass, method, RequestMapping.class);
        return mapping != null;
    }
}
