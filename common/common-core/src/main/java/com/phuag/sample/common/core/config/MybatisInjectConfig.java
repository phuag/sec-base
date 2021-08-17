package com.phuag.sample.common.core.config;

import com.phuag.sample.common.core.persistence.AuditMetaObjectHandler;
import com.phuag.sample.common.core.persistence.injector.TreeSqlInjector;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;

/**
 * @author phuag
 */
public class MybatisInjectConfig {

    @Bean
    public TreeSqlInjector sqlInjector() {
        return new TreeSqlInjector();
    }

    /**
     * 审计数据插件
     *
     * @return AuditMetaObjectHandler
     */
    @Bean
    @ConditionalOnMissingBean(name = "auditMetaObjectHandler")
    public AuditMetaObjectHandler auditMetaObjectHandler() {
        return new AuditMetaObjectHandler();
    }
}
