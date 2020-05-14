package com.phuag.sample.auth.configuration.shiro;

import org.apache.shiro.authc.credential.CredentialsMatcher;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.realm.AuthenticatingRealm;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.session.SessionListener;
import org.apache.shiro.session.mgt.ExecutorServiceSessionValidationScheduler;
import org.apache.shiro.session.mgt.SessionValidationScheduler;
import org.apache.shiro.session.mgt.eis.EnterpriseCacheSessionDAO;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.session.mgt.eis.SessionIdGenerator;
import org.apache.shiro.session.mgt.quartz.QuartzSessionValidationScheduler;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.filter.authc.BasicHttpAuthenticationFilter;
import org.apache.shiro.web.filter.authc.LogoutFilter;
import org.apache.shiro.web.servlet.Cookie;
import org.apache.shiro.web.servlet.SimpleCookie;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnWebApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;
import org.springframework.context.annotation.Import;
import org.springframework.web.filter.DelegatingFilterProxy;

import javax.servlet.Filter;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 *
 * @author vvvvvv
 * @date 2017/3/3
 */
@Configuration
@ConditionalOnWebApplication
@Import(ShiroConfiguration.class)
@EnableConfigurationProperties({
        ShiroProperties.class,
        ShiroSessionProperties.class
})
public class ShiroAutoConfiguration {

    @Autowired
    private ShiroProperties properties;

//    @Autowired
//    private ShiroCookieProperties shiroCookieProperties;

    @Autowired
    private ShiroSessionProperties shiroSessionProperties;

//    @Autowired
//    private ShiroSignInProperties shiroSignInProperties;

//    @Autowired(required = false)
//    private CipherService cipherService;

//    @Autowired(required = false)
//    private Serializer<PrincipalCollection> serializer;

    @Autowired(required = false)
    private Collection<SessionListener> listeners;

    /*@Bean(name = "mainRealm")
    @ConditionalOnMissingBean(name = "mainRealm")
    @ConditionalOnProperty(prefix = "shiro.realm.jdbc",name = "enabled",havingValue = "true")
    public Realm jdbcRealm(DataSource dataSource, CredentialsMatcher credentialsMatcher){
        JdbcRealm jdbcRealm = new JdbcRealm();

        //todo
        return jdbcRealm;
    }*/

    @Bean(name = "mainRealm")
    @ConditionalOnMissingBean(name = "mainRealm")
    @DependsOn(value = {"lifecycleBeanPostProcessor", "credentialsMatcher"})
    public Realm mainRealm(CredentialsMatcher credentialsMatcher){
        Class<?> realmClass = properties.getRealmClass();
        Realm realm = (Realm) BeanUtils.instantiateClass(realmClass);
        if(realm instanceof AuthenticatingRealm){
            ((AuthenticatingRealm)realm).setCredentialsMatcher(credentialsMatcher);
        }
        return realm;
    }

    /**
     * 缓存管理器-首选配置EhCacheManager
     */
    @Bean(name="cacheManager")
    @ConditionalOnClass(name = {"org.apache.shiro.cache.ehcache.EhCacheManager"})
    @ConditionalOnMissingBean(name="cacheManager")
    public CacheManager cacheManager(){
        EhCacheManager ehCacheManager = new EhCacheManager();
        ehCacheManager.setCacheManagerConfigFile(properties.getEhCacheManagerConfigFile());
        return ehCacheManager;
    }

    @Bean
    @ConditionalOnMissingBean(Cookie.class)
    public Cookie simpleCookie(){
        SimpleCookie simpleCookie = new SimpleCookie();
        simpleCookie.setName("AuthCookie");

        return simpleCookie;
    }

    @Bean
    @ConditionalOnMissingBean
    public SessionDAO sessionDAO(CacheManager cacheManager){
        EnterpriseCacheSessionDAO sessionDAO = new EnterpriseCacheSessionDAO();
        sessionDAO.setActiveSessionsCacheName(shiroSessionProperties.getActiveSessionCacheName());
        Class<? extends SessionIdGenerator> idGenerator= shiroSessionProperties.getIdGenerator();
        if (idGenerator != null){
            SessionIdGenerator sessionIdGenerator = BeanUtils.instantiateClass(idGenerator);
            sessionDAO.setSessionIdGenerator(sessionIdGenerator);
        }
        sessionDAO.setCacheManager(cacheManager);
        return sessionDAO;
    }

    @Bean(name = "sessionValidationScheduler")
    @DependsOn(value = {"sessionManager"})
    @ConditionalOnClass(name = {"org.quartz.Scheduler"})
    @ConditionalOnMissingBean(SessionValidationScheduler.class)
    public SessionValidationScheduler quartzSessionValidationScheduler(DefaultWebSessionManager sessionManager){
        QuartzSessionValidationScheduler quartzSessionValidationScheduler = new QuartzSessionValidationScheduler(sessionManager);
        sessionManager.setDeleteInvalidSessions(shiroSessionProperties.isDeleteInvalidSessions());
        sessionManager.setSessionValidationInterval(shiroSessionProperties.getValidationInterval());
        sessionManager.setSessionValidationSchedulerEnabled(shiroSessionProperties.isValidationSchedulerEnabled());
        sessionManager.setSessionValidationScheduler(quartzSessionValidationScheduler);
        return quartzSessionValidationScheduler;
    }

    @Bean(name = "sessionValidationScheduler")
    @DependsOn(value = {"sessionManager"})
    @ConditionalOnMissingBean(SessionValidationScheduler.class)
    public SessionValidationScheduler sessionValidationScheduler(DefaultWebSessionManager sessionManager){
        ExecutorServiceSessionValidationScheduler validationScheduler = new ExecutorServiceSessionValidationScheduler(sessionManager);
        sessionManager.setDeleteInvalidSessions(shiroSessionProperties.isDeleteInvalidSessions());
        sessionManager.setSessionValidationInterval(shiroSessionProperties.getValidationInterval());
        sessionManager.setSessionValidationSchedulerEnabled(shiroSessionProperties.isValidationSchedulerEnabled());
        sessionManager.setSessionValidationScheduler(validationScheduler);
        return validationScheduler;
    }

    @Bean
    @DependsOn(value = {"cacheManager", "sessionDAO"})
    public DefaultWebSessionManager sessionManager(CacheManager cacheManager, SessionDAO sessionDAO,Cookie cookie){
        DefaultWebSessionManager sessionManager = new DefaultWebSessionManager();
        sessionManager.setCacheManager(cacheManager);
        sessionManager.setGlobalSessionTimeout(shiroSessionProperties.getGlobalSessionTimeout());
        sessionManager.setSessionDAO(sessionDAO);
        sessionManager.setSessionListeners(listeners);
        sessionManager.setSessionIdCookie(cookie);

        return sessionManager;
    }

    @Bean(name = "credentialsMatcher")
    @ConditionalOnMissingBean
    @DependsOn("cacheManager")
    public CredentialsMatcher credentialsMatcher(CacheManager cacheManager){
        RetryLimitHashedCredentialsMatcher credentialsMatcher = new RetryLimitHashedCredentialsMatcher(cacheManager);
        credentialsMatcher.setHashAlgorithmName(properties.getHashAlgorithmName());
        credentialsMatcher.setHashIterations(properties.getHashIterations());
        credentialsMatcher.setStoredCredentialsHexEncoded(properties.isStoredCredentialsHexEncoded());
        credentialsMatcher.setRetryMax(properties.getRetryMax());
       return credentialsMatcher;
    }

    @Bean(name = "shiroFilter")
    @DependsOn("securityManager")
    @ConditionalOnMissingBean
    public ShiroFilterFactoryBean shiroFilterFactoryBean(SecurityManager securityManager){
        ShiroFilterFactoryBean shiroFilterFactoryBean = new  ShiroFilterFactoryBean();
        shiroFilterFactoryBean.setSecurityManager(securityManager);
        shiroFilterFactoryBean.setLoginUrl(properties.getLoginUrl());
        shiroFilterFactoryBean.setSuccessUrl(properties.getSuccessUrl());
        shiroFilterFactoryBean.setUnauthorizedUrl(properties.getUnauthorizedUrl());
        shiroFilterFactoryBean.setFilterChainDefinitionMap(properties.getFilterChainDefinitions());
        Map<String,Filter> filters = new LinkedHashMap<String, Filter>();

        BasicHttpAuthenticationFilter httpAuthenticationFilter = new BasicHttpAuthenticationFilter();
        httpAuthenticationFilter.setLoginUrl(properties.getLoginUrl());
        filters.put("authcBasic",httpAuthenticationFilter);

        LogoutFilter logoutFilter = new LogoutFilter();
        logoutFilter.setRedirectUrl(properties.getLoginUrl());
        filters.put("logout",logoutFilter);

        shiroFilterFactoryBean.setFilters(filters);
        return shiroFilterFactoryBean;
    }



    @Bean
    @ConditionalOnMissingBean
    public FilterRegistrationBean filterRegistrationBean(){
        FilterRegistrationBean filterRegistration = new FilterRegistrationBean();
        //缺省为false,表示生命周期由SpringApplicationContext管理，true表示由ServletContext管理
        filterRegistration.addInitParameter("targetFilterLifecycle","true");
        DelegatingFilterProxy proxy = new DelegatingFilterProxy("shiroFilter");
        filterRegistration.setFilter(proxy);
        filterRegistration.setEnabled(true);
        filterRegistration.addUrlPatterns("/*");
        return filterRegistration;
    }

}
