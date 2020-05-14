package com.phuag.sample.common.logging;

import com.phuag.sample.common.logging.enums.SysLogType;

import java.lang.annotation.*;

/**
 * 访问日志，在类或者方法上注解此类，将对方法进行访问日志记录
 * Created by vvvvvv on 2017/12/6.
 */
@Target({ElementType.TYPE,ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Inherited
public @interface AccessLogger {

    /**
     *
     * @return 模块说明
     */
    String module();

    /**
     * 对类或方法的详细描述
     * @return
     */
    String[] describe() default "";

    /**
     * 日志类型 登录 访问 操作 异常
     * @return
     */
    SysLogType type() default SysLogType.ACCESS;

    /**
     * 是否取消日志记录
     * @return
     */
    boolean ignore() default false;

}
