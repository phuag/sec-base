package com.phuag.sample.common.config;

import com.google.common.collect.Maps;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.support.PropertiesLoaderUtils;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.Properties;

/**
 * 全局配置类
 * @author phuag
 * @version 2016-06-25
 */
public class Global {


	/**
	 * 显示/隐藏
	 */
	public static final String SHOW = "1";
	public static final String HIDE = "0";

	/**
	 * 是/否
	 */
	public static final String YES = "1";
	public static final String NO = "0";
	
	/**
	 * 对/错
	 */
	public static final String TRUE = "true";
	public static final String FALSE = "false";
	
	/**
	 * 上传文件基础虚拟路径
	 */
	public static final String USERFILES_BASE_URL = "/userfiles/";
	

}
