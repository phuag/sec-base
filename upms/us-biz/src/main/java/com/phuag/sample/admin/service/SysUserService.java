package com.phuag.sample.admin.service;

import cn.hutool.core.util.ArrayUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.phuag.sample.admin.api.entity.SysMenu;
import com.phuag.sample.admin.api.entity.SysOffice;
import com.phuag.sample.admin.api.entity.SysRole;
import com.phuag.sample.admin.api.entity.SysUser;
import com.phuag.sample.admin.dao.SysUserMapper;
import com.phuag.sample.admin.api.model.SysUserDetail;
import com.phuag.sample.admin.api.model.SysUserForm;
import com.phuag.sample.common.core.persistence.service.CrudService;
import com.phuag.sample.common.core.util.DTOUtils;
import com.phuag.sample.common.core.util.WebUtils;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;


/**
 * @author Administrator
 * @date 2016/3/27 0027
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class SysUserService extends CrudService<SysUserMapper, SysUser> {

    private String defaultPwd = "123456";
    private static final PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();

//    @Resource
//    AuthenticationManager authenticationManager;

//    @Resource
//    JwtTokenProvider jwtTokenProvider;

    public SysUser getSysUserById(String id) {
        return baseMapper.selectById(id);
    }

    public Page<SysUser> getAllSysUser(Pageable page) {
        Page<SysUser> pageable = new Page<>(page.getPageNumber(), page.getPageSize());
        // TODO need to add sort function .
        // 添加排序
        return this.page(pageable, Wrappers.query(new SysUser()));
    }

    public SysUser getSysUserByLoginName(String username) {
        return baseMapper.selectSysUserByLoginName(username)
                .orElseThrow(() -> new UsernameNotFoundException("Username: " + username + " not found"));
    }

    public int updateByPrimaryKey(SysUser record) {
        return baseMapper.updateById(record);
    }

    public List<SysRole> getSysUserRolesByUser(SysUser user) {
        return baseMapper.getSysUserRolesByUser(user);
    }

    /**
     * 将SysUser中的password从明文转换为带盐密文后存储
     *
     * @param user        用户
     * @param oldPassword 修改密码时输入的原始密码明文
     * @param newPassword 修改密码时输入的新密码明文
     * @return 成功与否
     */
    public boolean updatePassword(SysUser user, String oldPassword, String newPassword) {
        // 验证原始密码是否正确
        boolean result = validatePassword(oldPassword, user.getPassword());
        if (result) {
            //密码正确 将新密码加密
            String hashedPassword = encryptPassword(newPassword);
            user.setPassword(hashedPassword);
            baseMapper.updateById(user);
            return true;
        } else {
            return false;
        }
    }

    /**
     * 重置密码为默认密码
     *
     * @param user 需要重置密码的用户
     * @return
     */
    public SysUser resetPassword(SysUser user) {
        String hashedPassword = encryptPassword(defaultPwd);
        user.setPassword(hashedPassword);
        baseMapper.updateById(user);
        return user;
    }

    /**
     * 生成安全的密码
     */
    private String encryptPassword(String plainPassword) {
        return passwordEncoder.encode(plainPassword);
    }

    /**
     * 验证密码
     *
     * @param plainPassword 明文密码
     * @param password      密文密码
     * @return 验证成功返回true
     */
    private boolean validatePassword(String plainPassword, String password) {
        boolean result = passwordEncoder.matches(plainPassword, password);
        return result;
    }

    public Page<SysUserDetail> searchSysUser(String officeId, String keyword, Pageable pageable) {
        Page<SysUser> page = new Page<>(pageable.getPageNumber(), pageable.getPageSize());

        // 获取分页结果
        Page<SysUser> sysUserPage = baseMapper.getByOfficeAndName(page, officeId, keyword);
        List<SysUser> sysUsers = sysUserPage.getRecords();
        // 补充office信息
        List<SysUserDetail> staffDetails = sysUsers.stream().map(sysUser -> {
            SysUserDetail sysUserDetail = fillOfficeInfo(sysUser);
            List<SysRole> roles = getSysUserRolesByUser(sysUser);
            List<String> roleIds = roles.stream().map(SysRole::getId).collect(Collectors.toList());
            sysUserDetail.setRoles(ArrayUtil.toArray(roleIds, String.class));
            return sysUserDetail;
        }).collect(Collectors.toList());
        // 创建pageInfo
        Page<SysUserDetail> pageInfo = new Page(page.getCurrent(), page.getSize());
        // 设置界面显示对象staffDetails为pageInfo的list
        pageInfo.setRecords(staffDetails);
        pageInfo.setTotal(sysUserPage.getTotal());
        return pageInfo;
    }

    public boolean insertSysUser(SysUserForm form) {
        SysUser sysUser = DTOUtils.map(form, SysUser.class);
        sysUser.setNewRecord(true);
        //复用办公室id
        sysUser.setCompanyId(sysUser.getOfficeId());
        //设置默认密码
        String hashedPassword = encryptPassword(defaultPwd);
        sysUser.setPassword(hashedPassword);
        return save(sysUser);
    }

    @Transactional(rollbackFor = Exception.class)
    public boolean updateSysUser(String sysUserId, SysUserForm form) {
        Assert.hasText(sysUserId, "sysUser id can not be null");
        SysUser sysUser = baseMapper.selectById(sysUserId);

        DTOUtils.mapTo(form, sysUser);
        return save(sysUser);
    }

    public void updateUserLoginInfo(SysUser user) {
        // 更新本次登录信息
        user.setLoginIp(WebUtils.getIpAddr(WebUtils.getHttpServletRequest()));
        user.setLoginDate(new Date());
        baseMapper.updateLoginInfo(user);
    }

    public SysUserDetail fillOfficeInfo(SysUser sysUser) {
        Assert.notNull(sysUser, "syUser can not be null");
        SysUserDetail sysUserDetail = DTOUtils.map(sysUser, SysUserDetail.class);
        SysOffice office = baseMapper.getSysUserOffice(sysUser);
        sysUserDetail.setOffice(office);
        return sysUserDetail;
    }

    public List<SysMenu> getSysMenu(String UserId) {
        Assert.notNull(UserId, "UserId can not be null");
        List<SysMenu> sysMenus = baseMapper.getSysMenu(UserId);
        return sysMenus;
    }

    public SysUserDetail getUserInfo(SysUser sysUser) {
        SysUserDetail userDetail = this.fillOfficeInfo(sysUser);
        // 设置角色列表 （ID）
        List<SysRole> roles = baseMapper.getSysUserRolesByUser(sysUser);
        List<String> roleIds = roles.stream().map(role -> role.getId()).collect(Collectors.toList());
        userDetail.setRoles(ArrayUtil.toArray(roleIds, String.class));

        List<SysMenu> sysMenus = baseMapper.getSysMenu(sysUser.getId());
        List<String> sysMenuIds = sysMenus.stream().map(menu -> menu.getPermissionCode()).collect(Collectors.toList());
        userDetail.setPermissions(ArrayUtil.toArray(sysMenuIds, String.class));
        return userDetail;
    }

//    public SysUserDetail signin(AuthenticationForm data) {
//        try {
//            String username = data.getUsername();
//            Authentication a = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(username, data.getPassword()));
//
//            SysUser sysUser = this.getSysUserByLoginName(username);
//            if (a.isAuthenticated()){
//                this.updateUserLoginInfo(sysUser);
//            }
//            List<SysMenu> menus = this.getSysMenu(sysUser.getId());
//            String token = jwtTokenProvider.createToken(username, menus.stream()
//                    .map(item -> item.getPermissionCode()).collect(Collectors.toList()));
//            SysUserDetail loginUser =  fillOfficeInfo(sysUser);
//            loginUser.setToken(token);
//            return loginUser;
//        } catch (AuthenticationException e) {
//            throw new BadCredentialsException("Invalid username/password supplied");
//        }
//    }

//    public SysUser whoami(HttpServletRequest req) {
//        return this.getSysUserByLoginName(jwtTokenProvider.getUsername(jwtTokenProvider.resolveToken(req)));
//    }


}
