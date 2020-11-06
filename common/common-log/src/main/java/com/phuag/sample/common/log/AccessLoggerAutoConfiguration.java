package com.phuag.sample.common.log;

import com.phuag.sample.admin.api.feign.RemoteLogService;
import com.phuag.sample.common.log.aspect.SysLogAspect;
import com.phuag.sample.common.log.event.SysLogListener;
import org.springframework.boot.autoconfigure.condition.ConditionalOnWebApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;

import javax.annotation.Resource;

/**
 *
 * @author phuag
 * @date 2017/12/6
 */
@EnableAsync
@ConditionalOnWebApplication
@Configuration(proxyBeanMethods = false)
public class AccessLoggerAutoConfiguration {

    @Resource
    private RemoteLogService remoteLogService;

    @Bean
    public SysLogListener sysLogListener() {
        return new SysLogListener(remoteLogService);
    }

    @Bean
    public SysLogAspect sysLogAspect() {
        return new SysLogAspect();
    }
}
