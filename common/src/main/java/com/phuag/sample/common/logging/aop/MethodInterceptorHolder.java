package com.phuag.sample.common.logging.aop;

import com.phuag.sample.common.util.AopUtil;
import com.phuag.sample.common.util.ThreadLocalUtils;
import lombok.Getter;
import org.aopalliance.intercept.MethodInvocation;
import org.springframework.core.LocalVariableTableParameterNameDiscoverer;
import org.springframework.core.ParameterNameDiscoverer;
import org.springframework.util.Assert;
import org.springframework.util.DigestUtils;

import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Optional;

/**
 *
 * @author vvvvvv
 * @date 2017/12/6
 */
@Getter
public class MethodInterceptorHolder {

    public static final ParameterNameDiscoverer NAME_DISCOVERER = new LocalVariableTableParameterNameDiscoverer();

    private String id;
    private Method method;
    private Object target;
    private Map<String, Object> args;

    public MethodInterceptorHolder(String id, Method method, Object target, Map<String, Object> args) {
        Assert.notNull(id, "id must not null.");
        Assert.notNull(method, "method must not null.");
        Assert.notNull(target, "target must not null.");
        Assert.notNull(args, "args must not null.");

        this.id = id;
        this.method = method;
        this.target = target;
        this.args = args;
    }

    public MethodInterceptorHolder set() {
        MethodInterceptorHolder.setCurrent(this);
        return this;
    }

    public static MethodInterceptorHolder current() {
        return ThreadLocalUtils.get(MethodInterceptorHolder.class.getName());
    }

    public static MethodInterceptorHolder clear() {
        return ThreadLocalUtils.getAndRemove(MethodInterceptorHolder.class.getName());
    }

    public static MethodInterceptorHolder setCurrent(MethodInterceptorHolder holder) {
        return ThreadLocalUtils.put(MethodInterceptorHolder.class.getName(), holder);
    }

    public static MethodInterceptorHolder create(MethodInvocation invocation) {
        byte[] plain = String.valueOf(invocation.getMethod().hashCode()).getBytes();
        String id = DigestUtils.md5DigestAsHex(plain);
        String[] argNames = NAME_DISCOVERER.getParameterNames(invocation.getMethod());
        Object[] args = invocation.getArguments();
        Map<String, Object> argMap = new LinkedHashMap<>();
        for (int i = 0; i < args.length; i++) {
            argMap.put(argNames[i] == null ? "arg" + i : argNames[i], args[i]);
        }
        return new MethodInterceptorHolder(id, invocation.getMethod(), invocation.getThis(), argMap);

    }

    public <T extends Annotation> T findMethodAnnotation(Class<T> annClass) {
        return AopUtil.findMethodAnnotation(annClass, method, annClass);
    }

    public <T extends Annotation> T findClassAnnotation(Class<T> annClass) {
        return AopUtil.findAnnotation(target.getClass(), annClass);
    }

    public <T extends Annotation> T findAnnotation(Class<T> annClass) {
        return AopUtil.findAnnotation(target.getClass(),method, annClass);
    }

    public MethodInterceptorContext createParamContext(){
        return new MethodInterceptorContext() {
            @Override
            public Object getTarget() {
                return target;
            }

            @Override
            public Method getMethod() {
                return method;
            }

            @Override
            public <T> Optional<T> getParameter(String name) {
                if(args ==null){
                    return Optional.empty();
                }
                return Optional.of((T) args.get(name));
            }

            @Override
            public <T extends Annotation> T getAnnotation(Class<T> type) {
                return findAnnotation(type);
            }

            @Override
            public Map<String, Object> getParams() {
                return getArgs();
            }
        };
    }

}
