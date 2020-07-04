package com.phuag.sample.admin.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.phuag.sample.admin.api.entity.SysMenu;
import com.phuag.sample.admin.api.entity.SysUser;
import com.phuag.sample.admin.api.model.AuthenticationForm;
import com.phuag.sample.admin.api.model.SysUserDetail;
import com.phuag.sample.admin.api.model.SysUserForm;
import com.phuag.sample.admin.api.model.UserPwdForm;
import com.phuag.sample.admin.service.SysUserService;
import com.phuag.sample.common.core.constant.Constants;
import com.phuag.sample.common.core.constant.SecurityConstants;
import com.phuag.sample.common.core.enums.ResultEnum;
import com.phuag.sample.common.core.exception.InnerException;
import com.phuag.sample.common.core.model.ResponseMessage;
import com.phuag.sample.common.core.util.ThreadLocalUtils;
import com.phuag.sample.common.security.util.SecurityUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

import static org.springframework.http.ResponseEntity.ok;

/**
 * @author phuag
 */
@RestController
@RequestMapping(value = Constants.URI_API + Constants.URI_SYS_USER)
@Slf4j
public class SysUserController {

    @Resource
    private SysUserService sysUserService;

    @GetMapping
    public ResponseEntity<Page<SysUserDetail>> getAllSysUser(
            @RequestParam(value = "office", required = false) String officeId,
            @RequestParam(value = "q", required = false) String keyword,
            @PageableDefault(page = 0, size = 20, sort = "id", direction = Sort.Direction.DESC) Pageable page) {
        log.debug("get all SysUser of office@{},name@{},page@{}", officeId, keyword, page);
        Page<SysUserDetail> sysUsers = sysUserService.searchSysUser(officeId, keyword, page);
        log.debug("get all SysUser, num:{},total:{}", sysUsers.getSize(), sysUsers.getTotal());
        return ok(sysUsers);
    }

    /**
     * Get the authenticated user info.
     *
     * @return
     */
    @PostMapping("/me")
    public ResponseEntity<SysUserDetail> user() {
        String username = SecurityUtils.getUser().getUsername();
        log.debug("get principal @{}", username);
        SysUser user = sysUserService.getOne(Wrappers.<SysUser>query()
                .lambda().eq(SysUser::getName, username));
        SysUserDetail sysUserDetail = sysUserService.fillOfficeInfo(user);

        return ok(sysUserDetail);
    }

    @GetMapping("/{username}")
    ResponseEntity<SysUserDetail> info(@PathVariable("username") String username){
        log.debug("get principal @{}", username);
        SysUser user = sysUserService.getOne(Wrappers.<SysUser>query()
                .lambda().eq(SysUser::getLoginName, username));
        if (user == null) {
            throw new UsernameNotFoundException("LoginName " + username + " not found");
        }
        SysUserDetail sysUserDetail = sysUserService.fillOfficeInfo(user);

        return ok(sysUserDetail);
    }

    @PostMapping("/signin")
    public ResponseEntity signin(@RequestBody AuthenticationForm data) {
        SysUserDetail loginUser = sysUserService.signin(data);
        log.debug("validate loginUser result @{}",loginUser.toString());
        return ok(loginUser);

    }

    @PostMapping("/myMenu")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<List<SysMenu>> menu() {
        String userId = SecurityUtils.getUser().getId();
        List<SysMenu> menus = sysUserService.getSysMenu(userId);
        return ok(menus);
    }

    @PostMapping("/logout")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<ResponseMessage> logout() {
        SecurityContextHolder.clearContext();
        ThreadLocalUtils.clear();
        return ok(ResponseMessage.info("logouted"));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<ResponseMessage> deleteSysUser(@PathVariable("id") String id) {
        log.debug("delete sysUser id@{}", id);
        boolean res = sysUserService.removeById(id);
        log.debug("deleted res is @{}", res);
        return ok(ResponseMessage.info("delete staff success:" + res));
    }

    @PostMapping
    public ResponseEntity<ResponseMessage> insertSysUser(@RequestBody SysUserForm from) {
        log.debug("save staff @{}", from);
        boolean res = sysUserService.insertSysUser(from);
        log.debug("saved res is @{}", res);
        return ok(ResponseMessage.info("insert success,res=" + res));


    }

    @PutMapping("/{id}")
    public ResponseEntity updateSysUser(@PathVariable("id") String sysUserId, @RequestBody SysUserForm form) {
        log.debug("update sysUser id@{},sysUser@{}", sysUserId, form);
        boolean res = sysUserService.updateSysUser(sysUserId, form);
        log.debug("updated res is @{}", res);
        return ok(ResponseMessage.info("update sysUser success,res=" + res));
    }

    @GetMapping("/checkLoginName")
    public ResponseEntity<Boolean> checkLoginName(@RequestParam(value = "oldLoginName", required = false) String oldLoginName,
                                                  @RequestParam(value = "loginName", required = false) String loginName) {
        if (loginName != null && loginName.equals(oldLoginName)) {
            return ok(true);
        } else if (loginName != null) {
            try {
                sysUserService.getSysUserByLoginName(loginName);
            }catch (UsernameNotFoundException e){
                // 未找到该用户名的存在
                return ok(true);
            }
        }
        return ok(false);
    }

    @GetMapping("/resetUserPwd/{id}")
    public ResponseEntity<ResponseMessage> resetUserPwd(@PathVariable String id) {
        log.debug("reset password sysUser id@{}", id);
        SysUser sysUser = sysUserService.getSysUserById(id);
        sysUserService.resetPassword(sysUser);
        log.debug("reset password res is @{}", sysUser);
        return ok(ResponseMessage.info("reset password staff success:" + sysUser));
    }

    @PostMapping("/modifyUserPwd")
    public ResponseEntity<ResponseMessage> modifyUserPwd(@RequestBody UserPwdForm userPwdForm) {
        SysUser sysUser = sysUserService.getSysUserById(userPwdForm.getUserId());
        boolean result = sysUserService.updatePassword(sysUser, userPwdForm.getOldPassword(), userPwdForm.getNewPassword());
        log.debug("reset password res is @{}", sysUser);
        if (!result) {
            throw new InnerException(ResultEnum.VERIFY_OLD_PASSWORD_FAIL);
        }
        return new ResponseEntity(ResponseMessage.success("修改成功"), HttpStatus.OK);
    }

    @DeleteMapping("/batchRemove/{ids}")
    public ResponseEntity<ResponseMessage> batchRemove(@PathVariable String[] ids) {
        for (String id : ids) {
            sysUserService.removeById(id);
        }
        return ok(ResponseMessage.info("batchremove SysUser"));
    }

}
