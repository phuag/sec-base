package com.phuag.sample.common.annotation;

import java.lang.annotation.*;

/**
 * Created by lhd on 2018/7/24.
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface DataFilter {
/*    *//**  表的别名 *//*
    String tableAlias() default "";
    *//** 区域名称 *//*
    String area_id() default "area_id";

    *//**  用户ID *//*
    String sysUserId() default "sys_user_id";*/
}
