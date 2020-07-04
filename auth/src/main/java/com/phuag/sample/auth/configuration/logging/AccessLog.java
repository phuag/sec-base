package com.phuag.sample.auth.configuration.logging;

import com.phuag.sample.common.log.AccessLogInfo;
import com.phuag.sample.common.log.AccessLoggerListener;
import com.phuag.sample.common.log.AopAccessLoggerSupport;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

/**
 *
 * @author vvvvvv
 * @date 2017/12/7
 */
@Component
@Slf4j
public class AccessLog implements AccessLoggerListener {

    @Autowired
    private AopAccessLoggerSupport aopAccessLoggerSupport;

    @PostConstruct
    public void addLoggerSupport() {
        aopAccessLoggerSupport.addListener(this);
    }

    @Override
    public void onLogger(AccessLogInfo logInfo) {
//        log.debug("拦截到调用信息:{}",logInfo.toString());
    }
}
