package com.phuag.sample.auth.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.phuag.sample.auth.domain.SysMenu;
import com.phuag.sample.auth.domain.SysUser;
import com.phuag.sample.auth.model.AuthenticationForm;
import com.phuag.sample.auth.model.SysUserDetail;
import com.phuag.sample.auth.model.SysUserForm;
import com.phuag.sample.auth.model.UserPwdForm;
import com.phuag.sample.auth.security.jwt.JwtTokenProvider;
import com.phuag.sample.auth.service.SysUserService;
import com.phuag.sample.common.config.Constants;
import com.phuag.sample.common.model.ResponseMessage;
import com.phuag.sample.common.enums.ResultEnum;
import com.phuag.sample.common.exception.InnerException;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticationException;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static org.springframework.http.ResponseEntity.ok;

/**
 * @author phuag
 */
@RestController
@RequestMapping(value = Constants.URI_API + Constants.URI_SYS_USER)
@Slf4j
public class SysUserController {

    @Autowired
    private SysUserService sysUserService;

    @Autowired
    AuthenticationManager authenticationManager;

    @Autowired
    JwtTokenProvider jwtTokenProvider;

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
        SysUser principal = (SysUser) SecurityUtils.getSubject().getPrincipal();
        log.debug("get principal @" + principal.toString());
        SysUserDetail sysUserDetail = sysUserService.fillOfficeInfo(principal);

        return ok(sysUserDetail);
    }

    @PostMapping("/signin")
    public ResponseEntity signin(@RequestBody AuthenticationForm data) {

        try {
            String username = data.getUsername();
            authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(username, data.getPassword()));
            SysUser sysUser = sysUserService.getSysUserByLoginName(username);
            String token = jwtTokenProvider.createToken(username, sysUserService.getSysUserRolesByUser(sysUser).stream()
                    .map(item -> item.getName()).collect(Collectors.toList()));

            Map<Object, Object> model = new HashMap<>();
            model.put("username", username);
            model.put("token", token);
            return ok(model);
        } catch (AuthenticationException e) {
            throw new BadCredentialsException("Invalid username/password supplied");
        }
    }

    @PostMapping("/myMenu")
    @RequiresPermissions("user")
    public ResponseEntity<List<SysMenu>> menu() {
        Subject subject = SecurityUtils.getSubject();
        SysUser principal = (SysUser) subject.getPrincipal();
        Session session = subject.getSession();
        List<SysMenu> menus = sysUserService.getSysMenu(principal);
        return ok(menus);
    }

    @PostMapping("/logout")
    public ResponseEntity<ResponseMessage> logout() {
        Subject subject = SecurityUtils.getSubject();
        if (subject.isAuthenticated()) {
            // session 会销毁，在SessionListener监听session销毁，清理权限缓存
            subject.logout();
        }
        return ok(ResponseMessage.info("logouted"));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity deleteSysUser(@PathVariable("id") String id) {
        log.debug("delete sysUser id@{}", id);
        int res = sysUserService.delete(id);
        log.debug("deleted res is @{}", res);
        return ok(ResponseMessage.info("delete staff success:" + res));
    }

    @PostMapping
    public ResponseEntity insertSysUser(@RequestBody SysUserForm from) {
        log.debug("save staff @{}", from);
        int res = sysUserService.insertSysUser(from);
        log.debug("saved res is @{}", res);
        return ok(ResponseMessage.info("insert success,res=" + res));


    }

    @PutMapping("/{id}")
    public ResponseEntity updateSysUser(@PathVariable("id") String sysUserId, @RequestBody SysUserForm form) {
        log.debug("update sysUser id@{},sysUser@{}", sysUserId, form);
        int res = sysUserService.updateSysUser(sysUserId, form);
        log.debug("updated res is @{}", res);
        return ok(ResponseMessage.info("update sysUser success,res=" + res));
    }

    @GetMapping("/checkLoginName")
    public ResponseEntity<Boolean> checkLoginName(@RequestParam(value = "oldLoginName", required = false) String oldLoginName,
                                                  @RequestParam(value = "loginName", required = false) String loginName) {
        if (loginName != null && loginName.equals(oldLoginName)) {
            return ok(true);
        } else if (loginName != null && sysUserService.getSysUserByLoginName(loginName) == null) {
            return ok(true);
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
            sysUserService.delete(id);
        }
        return ok(ResponseMessage.info("batchremove SysUser"));
    }

}
