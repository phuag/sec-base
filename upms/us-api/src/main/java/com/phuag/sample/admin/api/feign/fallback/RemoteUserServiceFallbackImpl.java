package com.phuag.sample.admin.api.feign.fallback;

import com.phuag.sample.admin.api.entity.SysUser;
import com.phuag.sample.admin.api.feign.RemoteUserService;
import com.phuag.sample.admin.api.model.SysUserDetail;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

/**
 * @author lengleng
 * @date 2019/2/1
 */
@Slf4j
@Component
public class RemoteUserServiceFallbackImpl implements RemoteUserService {
	@Setter
	private Throwable cause;

	/**
	 * 通过用户名查询用户、角色信息
	 *
	 * @param username 用户名
	 * @param from     内外标志
	 * @return R
	 */
	@Override
	public ResponseEntity<SysUserDetail> info(String username, String from) {
		log.error("feign 查询用户信息失败:{}", username, cause);
		return null;
	}

	/**
	 * 通过社交账号查询用户、角色信息
	 *
	 * @param inStr appid@code
	 * @return
	 */
	@Override
	public ResponseEntity<SysUser> social(String inStr) {
		log.error("feign 查询用户信息失败:{}", inStr, cause);
		return null;
	}
}
