package com.phuag.sample.admin.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.phuag.sample.admin.api.entity.SysOauthClientDetails;
import com.phuag.sample.admin.service.SysOauthClientDetailsService;
import io.swagger.annotations.Api;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author lengleng
 * @since 2018-05-15
 */
@RestController
@RequestMapping("/client")
@Api(value = "client", tags = "客户端管理模块")
public class OauthClientDetailsController {
	@Resource
	private SysOauthClientDetailsService sysOauthClientDetailsService;

	/**
	 * 通过ID查询
	 *
	 * @param id clientId
	 * @return SysOauthClientDetails
	 */
	@GetMapping("/{id}")
	public ResponseEntity getById(@PathVariable String id) {
		return ResponseEntity.ok(sysOauthClientDetailsService.getById(id));
	}


	/**
	 * 简单分页查询
	 *
	 * @param page                  分页对象
	 * @param sysOauthClientDetails 系统终端
	 * @return
	 */
	@GetMapping("/page")
	public ResponseEntity getOauthClientDetailsPage(Page page, SysOauthClientDetails sysOauthClientDetails) {
		return ResponseEntity.ok(sysOauthClientDetailsService.page(page, Wrappers.query(sysOauthClientDetails)));
	}

	/**
	 * 添加
	 *
	 * @param sysOauthClientDetails 实体
	 * @return success/false
	 */
	@PostMapping
	@PreAuthorize("@pms.hasPermission('sys_client_add')")
	public ResponseEntity add(@Valid @RequestBody SysOauthClientDetails sysOauthClientDetails) {
		return ResponseEntity.ok(sysOauthClientDetailsService.save(sysOauthClientDetails));
	}

	/**
	 * 删除
	 *
	 * @param id ID
	 * @return success/false
	 */
	@DeleteMapping("/{id}")
	@PreAuthorize("@pms.hasPermission('sys_client_del')")
	public ResponseEntity removeById(@PathVariable String id) {
		return ResponseEntity.ok(sysOauthClientDetailsService.removeClientDetailsById(id));
	}

	/**
	 * 编辑
	 *
	 * @param sysOauthClientDetails 实体
	 * @return success/false
	 */
	@PutMapping
	@PreAuthorize("@pms.hasPermission('sys_client_edit')")
	public ResponseEntity update(@Valid @RequestBody SysOauthClientDetails sysOauthClientDetails) {
		return ResponseEntity.ok(sysOauthClientDetailsService.updateClientDetailsById(sysOauthClientDetails));
	}
}
