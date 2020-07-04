package com.phuag.sample.admin.api.feign;

import com.phuag.sample.admin.api.entity.SysUser;
import com.phuag.sample.admin.api.feign.factory.RemoteUserServiceFallbackFactory;
import com.phuag.sample.admin.api.model.SysUserDetail;
import com.phuag.sample.common.core.constant.Constants;
import com.phuag.sample.common.core.constant.SecurityConstants;
import com.phuag.sample.common.core.constant.ServiceNameConstants;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author lengleng
 * @date 2019/2/1
 */
@FeignClient(contextId = "remoteUserService", value = ServiceNameConstants.UMPS_SERVICE, fallbackFactory = RemoteUserServiceFallbackFactory.class)
@RequestMapping(value = Constants.URI_API + Constants.URI_SYS_USER)
public interface RemoteUserService {
	/**
	 * 通过用户名查询用户、角色信息
	 *
	 * @param username 用户名
	 * @param from     调用标志
	 * @return R
	 */
	@GetMapping("/{username}")
	ResponseEntity<SysUserDetail> info(@PathVariable("username") String username
            , @RequestHeader(SecurityConstants.FROM) String from);

	/**
	 * 通过社交账号查询用户、角色信息
	 *
	 * @param inStr appid@code
	 * @return
	 */
	@GetMapping("/social/info/{inStr}")
	ResponseEntity<SysUser> social(@PathVariable("inStr") String inStr);
}
