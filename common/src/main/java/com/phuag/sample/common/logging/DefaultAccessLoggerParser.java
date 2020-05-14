package com.phuag.sample.common.logging;

import com.phuag.sample.common.config.logging.AccessLoggerParser;
import com.phuag.sample.common.logging.aop.MethodInterceptorHolder;
import org.springframework.core.annotation.AnnotationUtils;

import java.lang.reflect.Method;
import java.util.Objects;
import java.util.stream.Stream;

/**
 *
 * @author vvvvvv
 * @date 2017/12/8
 */
public class DefaultAccessLoggerParser implements AccessLoggerParser {
    @Override
    public boolean support(Class clazz, Method method) {
        AccessLogger ann = AnnotationUtils.findAnnotation(method, AccessLogger.class);
        return null != ann && !ann.ignore();
    }

    @Override
    public LoggerDefine parse(MethodInterceptorHolder holder) {
        AccessLogger methodAnn = holder.findMethodAnnotation(AccessLogger.class);
        AccessLogger classAnn = holder.findClassAnnotation(AccessLogger.class);
        String action = Stream.of(classAnn, methodAnn)
                .filter(Objects::nonNull)
                .map(AccessLogger::module)
                .reduce((c, m) -> c.concat("-").concat(m))
                .orElse(" ");
        String describe = Stream.of(classAnn, methodAnn)
                .filter(Objects::nonNull)
                .map(AccessLogger::describe)
                .flatMap(Stream::of)
                .reduce((c, s) -> c.concat("\n").concat(s))
                .orElse(" ");
        String type = " ";
        if (methodAnn != null) {
            type = methodAnn.type().getValue();
        }
        return new LoggerDefine(action, describe, type);
    }
}
