package com.phuag.sample.auth.configuration.shiro;

import lombok.Data;
import org.apache.shiro.session.mgt.eis.JavaUuidSessionIdGenerator;
import org.apache.shiro.session.mgt.eis.SessionIdGenerator;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 *
 * @author vvvvvv
 * @date 2017/3/9
 */
@ConfigurationProperties(prefix ="shiro.session")
@Data
public class ShiroSessionProperties {
    private long globalSessionTimeout = 30 * 60 * 1000L;

    private boolean deleteInvalidSessions = true;

    private long validationInterval = 60 * 60 * 1000L;

    private boolean validationSchedulerEnabled = true;

    private String activeSessionCacheName = "shiro-activeSessionCache";

    private Class<? extends SessionIdGenerator> idGenerator = JavaUuidSessionIdGenerator.class;

}
