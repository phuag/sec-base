package com.phuag.sample.auth.configuration;

import com.phuag.sample.admin.api.entity.SysUser;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.domain.AuditorAware;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.Optional;

/**
 * @author phuag
 */
@Configuration
public class DataJpaConfig {
    @Bean
    public AuditorAware<String> auditorProvider() {
        return ()-> Optional.ofNullable(SecurityContextHolder.getContext())
                .map(SecurityContext::getAuthentication)
                .filter(Authentication::isAuthenticated)
                .map(Authentication::getPrincipal)
                .map(SysUser.class::cast)
                .map(SysUser::getId);
    }
}
