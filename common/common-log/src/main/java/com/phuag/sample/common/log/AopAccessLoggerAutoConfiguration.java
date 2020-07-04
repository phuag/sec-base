package com.phuag.sample.common.log;

import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;

/**
 *
 * @author phuag
 * @date 2017/12/6
 */
@Configuration
@ConditionalOnClass(AccessLoggerListener.class)
public class AopAccessLoggerAutoConfiguration {

    @Bean
    public AopAccessLoggerSupport aopLoggerSupport() {
        return new AopAccessLoggerSupport();
    }

    @Bean
    @DependsOn("aopLoggerSupport")
    public DefaultAccessLoggerParser defaultAccessLoggerParser(AopAccessLoggerSupport loggerSupport) {
        DefaultAccessLoggerParser bean = new DefaultAccessLoggerParser();
        loggerSupport.addParser(bean);
        return bean;
    }
}
