package com.phuag.sample.auth.configuration;

import com.phuag.sample.common.security.component.JwtSecurityConfigurer;
import com.phuag.sample.common.security.component.JwtTokenProvider;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

import javax.annotation.Resource;

/**
 * @author phuag
 */
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Resource
    JwtTokenProvider jwtTokenProvider;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return PasswordEncoderFactories.createDelegatingPasswordEncoder();
    }

    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        //@formatter:off
        http
                .formLogin()
                //设置登录页面，默认跳转到这个页面,需要前端实现
                .loginPage("/token/login")
                //后端设置的密码接收url
                .loginProcessingUrl("/token/form")
                .and()
                .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                .and()
                .apply(new JwtSecurityConfigurer(jwtTokenProvider))
                .and()
                .authorizeRequests()
                .antMatchers("/api/sysUser/signin").permitAll()
                .antMatchers("/api/ping").permitAll()
                .antMatchers("/swagger-ui.html", "/v2/api-docs", "/swagger-resources/**").permitAll()
                .antMatchers("/webjars/**").permitAll()
                .antMatchers("/druid/**").permitAll()
                .anyRequest().authenticated()
                .and().csrf().disable();
        //@formatter:on
    }
}

