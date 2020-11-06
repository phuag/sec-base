package com.phuag.sample.auth.configuration;

import com.phuag.sample.common.core.constant.CacheConstants;
import com.phuag.sample.common.core.constant.SecurityConstants;
import com.phuag.sample.common.security.component.AuthWebResponseExceptionTranslator;
import com.phuag.sample.common.security.service.AuthClientDetailsService;
import com.phuag.sample.common.security.service.AuthUser;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;
import org.springframework.security.oauth2.config.annotation.configurers.ClientDetailsServiceConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.AuthorizationServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerEndpointsConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.token.TokenEnhancer;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.redis.RedisTokenStore;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.util.HashMap;
import java.util.Map;

/**
 * @author lengleng
 * @date 2019/2/1
 * 认证服务器配置
 */
@Configuration
@EnableAuthorizationServer
public class AuthorizationServerConfig extends AuthorizationServerConfigurerAdapter {
	@Autowired
	private DataSource dataSource;
	@Autowired
	private UserDetailsService userDetailsService;
	@Autowired
	private AuthenticationManager authenticationManager;
	@Autowired
	private RedisConnectionFactory redisConnectionFactory;


	@Override
	@SneakyThrows
	public void configure(ClientDetailsServiceConfigurer clients) {
		AuthClientDetailsService clientDetailsService = new AuthClientDetailsService(dataSource);
		clientDetailsService.setSelectClientDetailsSql(SecurityConstants.DEFAULT_SELECT_STATEMENT);
		clientDetailsService.setFindClientDetailsSql(SecurityConstants.DEFAULT_FIND_STATEMENT);
		clients.withClientDetails(clientDetailsService);
	}

	@Override
	public void configure(AuthorizationServerSecurityConfigurer oauthServer) {
		oauthServer
			.allowFormAuthenticationForClients()
			.checkTokenAccess("permitAll()");
	}

	@Override
	public void configure(AuthorizationServerEndpointsConfigurer endpoints) {
		endpoints
			.allowedTokenEndpointRequestMethods(HttpMethod.GET, HttpMethod.POST)
			.tokenStore(tokenStore())
			.tokenEnhancer(tokenEnhancer())
			.userDetailsService(userDetailsService)
			.authenticationManager(authenticationManager)
			.reuseRefreshTokens(false)
			.pathMapping("/oauth/confirm_access", "/token/confirm_access")
			.exceptionTranslator(new AuthWebResponseExceptionTranslator());
	}

	@Bean
	public TokenStore tokenStore() {
		RedisTokenStore tokenStore = new RedisTokenStore(redisConnectionFactory);
		tokenStore.setPrefix(CacheConstants.PROJECT_OAUTH_ACCESS);
		return tokenStore;
	}

	@Bean
	public TokenEnhancer tokenEnhancer() {
		return (accessToken, authentication) -> {
			final Map<String, Object> additionalInfo = new HashMap<>(4);
			AuthUser pigUser = (AuthUser) authentication.getUserAuthentication().getPrincipal();
			additionalInfo.put(SecurityConstants.DETAILS_LICENSE, SecurityConstants.PROJECT_LICENSE);
			additionalInfo.put(SecurityConstants.DETAILS_USER_ID, pigUser.getId());
			additionalInfo.put(SecurityConstants.DETAILS_USERNAME, pigUser.getUsername());
			additionalInfo.put(SecurityConstants.DETAILS_OFFICE_ID, pigUser.getOfficeId());
			((DefaultOAuth2AccessToken) accessToken).setAdditionalInformation(additionalInfo);
			return accessToken;
		};
	}
}
