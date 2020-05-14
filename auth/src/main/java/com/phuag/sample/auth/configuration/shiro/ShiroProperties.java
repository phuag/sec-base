package com.phuag.sample.auth.configuration.shiro;

import lombok.Data;
import org.apache.shiro.realm.Realm;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.util.Map;

/**
 *
 * @author vvvvvv
 * @date 2017/3/9
 */
@ConfigurationProperties(prefix ="shiro")
@Data
public class ShiroProperties {
    private Class<? extends Realm> realmClass = null;

    private String loginUrl = "/login";

    private String successUrl = "/index";

    private String unauthorizedUrl = "/unauthorized";

    private String hashAlgorithmName = "SHA-1";

    private int hashIterations = 1024;

    private int saltSize = 8;

    private int retryMax = 5;

    private boolean storedCredentialsHexEncoded = true;

    private Map<String, String> filterChainDefinitions;

    private String filerChainSql;

    private String ehCacheManagerConfigFile = "classpath:ehcache/ehcache-shiro.xml";

}
