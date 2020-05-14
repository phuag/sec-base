package com.phuag.sample.common.logging.aop;

import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.Optional;

/**
 *
 * @author vvvvvv
 * @date 2017/12/7
 */
public interface MethodInterceptorContext {
    /**
     * 获取目标
     * @return 目标实例
     */
    Object getTarget();

    Method getMethod();

    <T> Optional<T> getParameter(String name);

    <T extends Annotation> T getAnnotation(Class<T> type);

    Map<String,Object> getParams();
}
