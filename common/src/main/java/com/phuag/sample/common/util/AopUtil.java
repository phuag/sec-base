package com.phuag.sample.common.util;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.util.ClassUtils;

import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 *
 * @author vvvvvv
 * @date 2017/12/7
 */
public abstract class AopUtil {

    public static <T extends Annotation> T findMethodAnnotation(Class targetClass, Method method, Class<T> annClass) {
        Method m = method;
        T a = AnnotationUtils.findAnnotation(m, annClass);
        if (a != null) {
            return a;
        }
        m = ClassUtils.getMostSpecificMethod(m, targetClass);
        a = AnnotationUtils.findAnnotation(m, annClass);
        return a;
    }

    public static <T extends Annotation> T findAnnotation(Class targetClass, Class<T> annClass) {
        return AnnotationUtils.findAnnotation(targetClass, annClass);
    }

    public static <T extends Annotation> T findAnnotation(Class targetClass, Method method, Class<T> annClass) {
        T a = findMethodAnnotation(targetClass, method, annClass);
        if (a != null) {
            return a;
        }
        return findAnnotation(targetClass, annClass);
    }

    public static <T extends Annotation> T findAnnotation(JoinPoint pjp, Class<T> annClass) {
        MethodSignature signature = (MethodSignature) pjp.getSignature();
        Method m = signature.getMethod();
        Class<?> targetClass = pjp.getTarget().getClass();
        return findAnnotation(targetClass, m, annClass);
    }

    public static final String getMethodBody(JoinPoint pjp) {
        StringBuilder methodName = new StringBuilder(pjp.getSignature().getName()).append("(");
        MethodSignature signature = (MethodSignature) pjp.getSignature();
        String[] names = signature.getParameterNames();
        Class[] args = signature.getParameterTypes();
        for (int i = 0, len = args.length; i < len; i++) {

            methodName.append(args[i].getSimpleName()).append(" ").append(names[i]);
            methodName.append(",");
        }
        //去掉for循环的最后一个逗号
        methodName.delete(methodName.length() - 1, methodName.length());
        return methodName.append(")").toString();
    }

    public static final Map<String,Object> getArgsMap(JoinPoint pjp){
        MethodSignature signature = (MethodSignature) pjp.getSignature();
        Map<String,Object> args = new LinkedHashMap<>();
        String[] names = signature.getParameterNames();
        Object[] pjpArgs = pjp.getArgs();
        for (int i = 0, len = names.length; i < len; i++) {
            args.put(names[i],pjpArgs[i]);
        }
        return args;
    }
}
