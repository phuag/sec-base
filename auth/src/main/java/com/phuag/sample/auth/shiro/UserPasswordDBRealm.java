package com.phuag.sample.auth.shiro;

import com.phuag.sample.auth.domain.SysMenu;
import com.phuag.sample.auth.domain.SysUser;
import com.phuag.sample.auth.service.SysUserService;
import com.phuag.sample.common.config.Global;
import com.phuag.sample.common.util.Encodes;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.*;


/**
 * @author vvvvvv
 */
public class UserPasswordDBRealm extends AuthorizingRealm {

    @Autowired
    private SysUserService sysUserService;

    private boolean allowUserMutiLogin = true;

    /**
     * 认证回调函数, 登录时调用
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(
            AuthenticationToken authcToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        String username = token.getUsername();
        SysUser user = sysUserService.getSysUserByLoginName(username);
        if (user == null) {
            // 没找到帐号
            throw new UnknownAccountException("用户不存在");
        }
        if (!Global.YES.equals(user.getLoginFlag())) {
            //不允许登录
            throw new DisabledAccountException("用户不允许登录");
        }
        //salt与用户那边的输入没有关系，仅作为隐藏真实密码原文做的变换
        byte[] salt = Encodes.decodeHex(user.getPassword().substring(0, 16));
        //准备准确的认证信息，后面shiro使用用户提交的token信息与真实的认证信息进行比对。
        SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(user, user.getPassword().substring(16),
                ByteSource.Util.bytes(salt),
                getName());
        return simpleAuthenticationInfo;
    }

    /**
     * 授权查询回调函数, 进行鉴权时调用
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(
            PrincipalCollection principals) {
        SysUser principal = (SysUser) getAvailablePrincipal(principals);
        if (!allowUserMutiLogin) {
            //不允许多用户同时登录，同一用户则需踢掉前面登录上的session
            Collection<Session> sessions = sysUserService.getSessionDao().getActiveSessions();
            if (sessions.size() > 0) {
                // 如果是登录进来的，则踢出已在线用户
                if (SecurityUtils.getSubject().isAuthenticated()) {
                    for (Session session : sessions) {
                        sysUserService.getSessionDao().delete(session);
                    }
                }
                // 记住我进来的，并且当前用户已登录，则退出当前用户提示信息。
                else {
                    SecurityUtils.getSubject().logout();
                    throw new AuthenticationException("msg:账号已在其它地方登录，请重新登录。");
                }
            }
        }
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        authorizationInfo.addStringPermission("user");
        //Session session = SecurityUtils.getSubject().getSession();
        //List<SysMenu> menus = (List<SysMenu>) session.getAttribute(Constants.SESSION_USER_PERMISSION);
        List<SysMenu> menus = sysUserService.getSysMenu(principal);
        for (SysMenu perms : menus) {
            if (perms == null) {
                continue;
            }
            authorizationInfo.addStringPermission(perms.getPermissionCode());
        }
        sysUserService.updateUserLoginInfo(principal);
        return authorizationInfo;
    }
}