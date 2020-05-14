package com.phuag.sample.auth.controller;

import com.phuag.sample.auth.domain.SysUser;
import com.phuag.sample.auth.model.SysUserDetail;
import com.phuag.sample.auth.service.SysUserService;
import com.phuag.sample.common.config.Constants;
import com.phuag.sample.common.util.Encodes;
import com.phuag.sample.common.enums.ResultEnum;
import com.phuag.sample.common.exception.InnerException;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;


/**
 * Created by Administrator on 2018/7/20.
 */
@RestController
@RequestMapping(value = Constants.URI_API + Constants.URI_SYS)

@Slf4j
public class SysLoginController {
    @Autowired
    private SysUserService sysUserService;

//    @Value("${sysUser.defaultPwd}")
//    private String defaultPwd;

    /**
     * Get the authenticated user info.
     *
     * @return
     */
    @PostMapping("/login")
    public ResponseEntity<SysUserDetail> login(HttpServletRequest request) throws Exception{
        try{
            String tokenStr = WebUtils.toHttp(request).getHeader("Authorization");
            tokenStr = tokenStr.replace("Basic ","").trim();
            String userNameAndPassword = Encodes.decodeBase64String(tokenStr);
            org.apache.shiro.subject.Subject subject = SecurityUtils.getSubject();
            String username = userNameAndPassword.split(":")[0];
            String password = userNameAndPassword.split(":")[1];
            UsernamePasswordToken token = new UsernamePasswordToken(username, password);
            subject.login(token);
        }catch (UnknownAccountException e) {
            throw  new InnerException(ResultEnum.USERNAME_OR_PASSWORD_ERROR);
        }catch (IncorrectCredentialsException e) {
            throw  new InnerException(ResultEnum.USERNAME_OR_PASSWORD_ERROR);
        }catch (LockedAccountException e) {
            throw  new InnerException(ResultEnum.ACCOUNT_LOCKED);
        }catch (DisabledAccountException e){
            throw  new InnerException(ResultEnum.NOT_ALLOWED_LOGIN);
        } catch (AuthenticationException e) {
            throw  new InnerException(ResultEnum.ACCOUNT_AUTHENTICATION_FAIL);
        }catch (Exception e){
            e.printStackTrace();
        }
        SysUser principal = (SysUser) SecurityUtils.getSubject().getPrincipal();
        log.debug("get principal @" + principal.toString());
        SysUserDetail sysUserDetail = sysUserService.fillOfficeInfo(principal);
        return new ResponseEntity<>(sysUserDetail, HttpStatus.OK);
    }
}
