/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.phuag.sample.auth.util;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.phuag.sample.auth.dao.SysLogMapper;
import com.phuag.sample.auth.dao.SysMenuMapper;
import com.phuag.sample.auth.domain.SysLog;
import com.phuag.sample.auth.domain.SysMenu;
import com.phuag.sample.auth.domain.SysUser;
import com.phuag.sample.common.logging.AccessLogInfo;
import com.phuag.sample.common.util.Exceptions;
import com.phuag.sample.common.util.IdGen;
import com.phuag.sample.common.util.SpringContextHolder;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheManager;
import org.springframework.web.method.HandlerMethod;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

/**
 * 日志工具类
 * @author ThinkGem
 * @version 2014-11-7
 */
public class LogUtils {
	
	public static final String CACHE_MENU_NAME_PATH_MAP = "menuNamePathMap";
	
	private static SysLogMapper logDao = SpringContextHolder.getBean(SysLogMapper.class);
	private static SysMenuMapper menuDao = SpringContextHolder.getBean(SysMenuMapper.class);

	private static Cache<String, Map<String, String>> sys_Menu_Cache =
			SpringContextHolder.getBean(CacheManager.class).getCache("sysCache");
	
	/**
	 * 保存日志
	 */
	public static void saveLog(HttpServletRequest request, String title){
		saveLog(request, null, null, title);
	}
	/**
	 * 保存日志
	 */
	public static void saveLog(AccessLogInfo accessLog){
		SysUser user = UserUtil.getUser();
		if (user != null && user.getId() != null){
			SysLog log = new SysLog();
			log.setTitle("test");
			log.setId(IdGen.uuid());
			log.setRemoteAddr(accessLog.getIp());
			log.setType(accessLog.getExcepion() == null ? SysLog.TYPE_ACCESS : SysLog.TYPE_EXCEPTION );
//			log.setRemoteAddr(StringUtils.getRemoteAddr(request));
			log.setUserAgent(accessLog.getHttpHeaders().get("user-agent"));
			log.setRequestUri(accessLog.getUrl());
//			log.setParams(request.getParameterMap());
			log.setMethod(accessLog.getHttpMethod());
			// 异步保存日志
			new SaveLogThread(log, null, null).start();
		}
	}

	/**
	 * 保存日志
	 */
	public static void saveLog(HttpServletRequest request, Object handler, Exception ex, String title){
		SysUser user = UserUtil.getUser();
		if (user != null && user.getId() != null){
			SysLog log = new SysLog();
			log.setTitle(title);
			log.setType(ex == null ? SysLog.TYPE_ACCESS : SysLog.TYPE_EXCEPTION);
//			log.setRemoteAddr(StringUtils.getRemoteAddr(request));
			log.setUserAgent(request.getHeader("user-agent"));
			log.setRequestUri(request.getRequestURI());
//			log.setParams(request.getParameterMap());
			log.setMethod(request.getMethod());
			log.preInsert();
			// 异步保存日志
			new SaveLogThread(log, handler, ex).start();
		}
	}

	/**
	 * 保存日志线程
	 */
	public static class SaveLogThread extends Thread{
		
		private SysLog log;
		private Object handler;
		private Exception ex;
		
		public SaveLogThread(SysLog log, Object handler, Exception ex){
			super(SaveLogThread.class.getSimpleName());
			this.log = log;
			this.handler = handler;
			this.ex = ex;
		}
		
		@Override
		public void run() {
			// 获取日志标题
			if (StringUtils.isBlank(log.getTitle())){
				String permission = "";
				if (handler instanceof HandlerMethod){
					Method m = ((HandlerMethod)handler).getMethod();
					RequiresPermissions rp = m.getAnnotation(RequiresPermissions.class);
					permission = (rp != null ? StringUtils.join(rp.value(), ",") : "");
				}
				log.setTitle(getMenuNamePath(log.getRequestUri(), permission));
			}
			// 如果有异常，设置异常信息
			log.setException(Exceptions.getStackTraceAsString(ex));
			// 如果无标题并无异常日志，则不保存信息
			if (StringUtils.isBlank(log.getTitle()) && StringUtils.isBlank(log.getException())){
				return;
			}
			// 保存日志信息
			logDao.insert(log);
		}
	}

	/**
	 * 获取菜单名称路径（如：系统设置-机构用户-用户管理-编辑）
	 */
	public static String getMenuNamePath(String requestUri, String permission){
		String href = StringUtils.substringAfter(requestUri, "");
		@SuppressWarnings("unchecked")
		Map<String, String> menuMap = (Map<String, String>)sys_Menu_Cache.get(CACHE_MENU_NAME_PATH_MAP);
		if (menuMap == null){
			menuMap = Maps.newHashMap();
			List<SysMenu> menuList = menuDao.selectList(null);
			for (SysMenu menu : menuList){
				// 获取菜单名称路径（如：系统设置-机构用户-用户管理-编辑）
				String namePath = "";
				if (menu != null){
					List<String> namePathList = Lists.newArrayList();
					for (SysMenu m : menuList) {
						namePathList.add(m.getName());
					}
					namePathList.add(menu.getName());
					namePath = StringUtils.join(namePathList, "-");
				}
				// 设置菜单名称路径
				if (StringUtils.isNotBlank(menu.getCode())){
					menuMap.put(menu.getCode(), namePath);
				}else if (StringUtils.isNotBlank(menu.getPermission())){
					for (String p : StringUtils.split(menu.getPermission())){
						menuMap.put(p, namePath);
					}
				}

			}
			sys_Menu_Cache.put(CACHE_MENU_NAME_PATH_MAP, menuMap);
		}
		String menuNamePath = menuMap.get(href);
		if (menuNamePath == null){
			for (String p : StringUtils.split(permission)){
				menuNamePath = menuMap.get(p);
				if (StringUtils.isNotBlank(menuNamePath)){
					break;
				}
			}
			if (menuNamePath == null){
				return "";
			}
		}
		return menuNamePath;
	}

	
}
