package com.phuag.sample.common.config.logging;


import com.phuag.sample.common.logging.LoggerDefine;
import com.phuag.sample.common.logging.aop.MethodInterceptorHolder;

import java.lang.reflect.Method;

/**
 *
 * @author vvvvvv
 * @date 2017/12/6
 */
public interface AccessLoggerParser {
    boolean support(Class clazz, Method method);
    LoggerDefine parse(MethodInterceptorHolder holder);
}
