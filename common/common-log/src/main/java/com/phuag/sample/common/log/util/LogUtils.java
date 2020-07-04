package com.phuag.sample.common.log.util;

import cn.hutool.extra.servlet.ServletUtil;
import cn.hutool.http.HttpUtil;
import com.phuag.sample.admin.api.entity.SysLog;
import com.phuag.sample.common.core.util.IdGen;
import com.phuag.sample.common.log.AccessLogInfo;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Objects;

/**
 * 日志工具类
 * @author ThinkGem
 * @version 2014-11-7
 */
public class LogUtils {

	public SysLog getSysLog(AccessLogInfo accessLog) {
		HttpServletRequest request = ((ServletRequestAttributes) Objects
				.requireNonNull(RequestContextHolder.getRequestAttributes())).getRequest();
		SysLog sysLog = new SysLog();
		sysLog.setId(IdGen.uuid());
		sysLog.setTitle(accessLog.getAction());
		sysLog.setCreateBy(accessLog.getOperUserId());
		sysLog.setType(accessLog.getExcepion() == null ? SysLog.TYPE_ACCESS : SysLog.TYPE_EXCEPTION );
		sysLog.setRemoteAddr(ServletUtil.getClientIP(request));
		sysLog.setRequestUri(accessLog.getUrl());
		sysLog.setUserAgent(request.getHeader("user-agent"));
		sysLog.setParams(HttpUtil.toParams(request.getParameterMap()));
		sysLog.setMethod(accessLog.getHttpMethod());
		sysLog.setServiceId(getClientId());
		return sysLog;
	}

	/**
	 * 获取客户端
	 *
	 * @return clientId
	 */
	private String getClientId() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication instanceof OAuth2Authentication) {
			OAuth2Authentication auth2Authentication = (OAuth2Authentication) authentication;
			return auth2Authentication.getOAuth2Request().getClientId();
		}
		return null;
	}

}
