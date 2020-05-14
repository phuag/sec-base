package com.phuag.sample.auth.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.phuag.sample.auth.domain.SysRole;
import com.phuag.sample.auth.model.SysRoleForm;
import com.phuag.sample.auth.service.SysRoleService;
import com.phuag.sample.common.config.Constants;
import com.phuag.sample.common.model.ResponseMessage;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 *
 * @author Administrator
 * @date 2018/7/18
 */
@RestController
@RequestMapping(value = Constants.URI_API + Constants.URI_SYS_ROLE)
@Slf4j
public class SysRoleController {

    @Autowired
    private SysRoleService roleService;

    /**
     * 查询所有及其查询name
     */
    @GetMapping
    @ResponseBody
    public ResponseEntity<Page<SysRole>> getAllRole(
            @RequestParam(value = "q", required = false) String keyword,
            @PageableDefault(page = 0, size = 20, sort = "roleId", direction = Sort.Direction.DESC) Pageable page) {
        Page<SysRole> roleDetails = roleService.roleDetailList(page, keyword);
        return ResponseEntity.ok(roleDetails);
    }

    /**
     * 新增功能
     */
    @PostMapping
    @RequestMapping
    public ResponseEntity saveRole(@RequestBody SysRoleForm from) {
        roleService.saveSysRole(from);
        return ResponseEntity.ok(Constants.SAVE_SUCCESS);
    }

    /**
     * 删除
     */
    @DeleteMapping("/{id}")
    @ResponseBody
    public ResponseEntity deleteRole(@PathVariable("id") String id) {
        roleService.deleteRole(id);
        return ResponseEntity.ok(Constants.DELETE_SUCCESS);
    }

    /**
     * 批量删除
     */
    @DeleteMapping("/batchRemove")
    @ResponseBody
    public ResponseEntity batchRemove(String[] ids) {
        roleService.batchDeleteRole(ids);
        return ResponseEntity.ok(Constants.DELETE_SUCCESS);
    }

    @PutMapping("/{id}")
    @ResponseBody
    public ResponseEntity updateStaff(
            @PathVariable("id") String sysRoleId, @RequestBody SysRoleForm form) {
        log.debug("update sysUser id@{},sysUser@{}", sysRoleId, form);
        roleService.updateSysRole(sysRoleId, form);
        return ResponseEntity.ok(ResponseMessage.info("更新成功"));
    }

}


