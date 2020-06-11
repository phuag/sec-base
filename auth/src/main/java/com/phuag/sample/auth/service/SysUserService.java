package com.phuag.sample.auth.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.phuag.sample.auth.dao.SysUserMapper;
import com.phuag.sample.auth.domain.SysMenu;
import com.phuag.sample.auth.domain.SysOffice;
import com.phuag.sample.auth.domain.SysRole;
import com.phuag.sample.auth.domain.SysUser;
import com.phuag.sample.auth.model.AuthenticationForm;
import com.phuag.sample.auth.model.SysUserDetail;
import com.phuag.sample.auth.model.SysUserForm;
import com.phuag.sample.auth.security.jwt.JwtTokenProvider;
import com.phuag.sample.auth.util.WebUtil;
import com.phuag.sample.common.persistence.service.CrudService;
import com.phuag.sample.common.util.DTOUtil;
import com.phuag.sample.common.util.ThreadLocalUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import javax.servlet.http.HttpServletRequest;
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
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    AuthenticationManager authenticationManager;

    @Autowired
    JwtTokenProvider jwtTokenProvider;

    public SysUser getSysUserById(String id) {
        return dao.selectById(id);
    }

    public Page<SysUser> getAllSysUser(Pageable page) {
//        PageHelper.startPage(page.getPageNumber(), page.getPageSize());
        // TODO need to add sort function ,but the pagerhelper is not support well.
        // 添加排序
        return super.findPage(page, null);
    }

    public SysUser getSysUserByLoginName(String username) {
        return dao.selectSysUserByLoginName(username)
                .orElseThrow(() -> new UsernameNotFoundException("Username: " + username + " not found"));
    }

    public int updateByPrimaryKey(SysUser record) {
        return dao.updateById(record);
    }

    public List<SysRole> getSysUserRolesByUser(SysUser user) {
        return dao.getSysUserRolesByUser(user);
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
            dao.updateById(user);
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
        dao.updateById(user);
        return user;
    }

    /**
     * 生成安全的密码
     */
    public String encryptPassword(String plainPassword) {
        return passwordEncoder.encode(plainPassword);
    }

    /**
     * 验证密码
     *
     * @param plainPassword 明文密码
     * @param password      密文密码
     * @return 验证成功返回true
     */
    public boolean validatePassword(String plainPassword, String password) {
        boolean result = passwordEncoder.matches(plainPassword, password);
        return result;
    }

    public Page<SysUserDetail> searchSysUser(String officeId, String keyword, Pageable pageable) {
        Page<SysUser> page = new Page<>(pageable.getPageNumber(), pageable.getPageSize());

        // 获取分页结果
        Page<SysUser> sysUserPage = dao.getByOfficeAndName(page, officeId, keyword);
        List<SysUser> sysUsers = sysUserPage.getRecords();
        // 补充office信息
        List<SysUserDetail> staffDetails = sysUsers.stream().map(sysUser -> {
            SysUserDetail sysUserDetail = fillOfficeInfo(sysUser);
            return sysUserDetail;
        }).collect(Collectors.toList());
        // 创建pageInfo
        Page<SysUserDetail> pageInfo = new Page(page.getCurrent(), page.getSize());
        // 设置界面显示对象staffDetails为pageInfo的list
        pageInfo.setRecords(staffDetails);
        pageInfo.setTotal(sysUserPage.getTotal());
        return pageInfo;
    }

    public int insertSysUser(SysUserForm form) {
        SysUser sysUser = DTOUtil.map(form, SysUser.class);
        sysUser.setNewRecord(true);
        //设置默认密码
        String hashedPassword = encryptPassword(defaultPwd);
        sysUser.setPassword(hashedPassword);
        return save(sysUser);
    }

    @Transactional(rollbackFor = Exception.class)
    public int updateSysUser(String sysUserId, SysUserForm form) {
        Assert.hasText(sysUserId, "sysUser id can not be null");
        SysUser sysUser = dao.selectById(sysUserId);
        DTOUtil.mapTo(form, sysUser);
        return save(sysUser);
    }

    public void updateUserLoginInfo(SysUser user) {
        // 更新本次登录信息
        user.setLoginIp(WebUtil.getIpAddr(WebUtil.getHttpServletRequest()));
        user.setLoginDate(new Date());
        dao.updateLoginInfo(user);
    }

    public SysUserDetail fillOfficeInfo(SysUser sysUser) {
        Assert.notNull(sysUser, "syUser can not be null");
        SysUserDetail sysUserDetail = DTOUtil.map(sysUser, SysUserDetail.class);
        SysOffice office = dao.getSysUserOffice(sysUser);
        sysUserDetail.setOffice(office);
        return sysUserDetail;
    }

    public List<SysMenu> getSysMenu(SysUser sysUser) {
        Assert.notNull(sysUser, "syUser can not be null");
        List<SysMenu> sysMenus = dao.getSysMenu(sysUser);
        return sysMenus;
    }

    public SysUserDetail signin(AuthenticationForm data) {
        try {
            String username = data.getUsername();
            Authentication a = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(username, data.getPassword()));
            a.isAuthenticated();
            SysUser sysUser = this.getSysUserByLoginName(username);
            List<SysMenu> menus = this.getSysMenu(sysUser);
            String token = jwtTokenProvider.createToken(username, menus.stream()
                    .map(item -> item.getPermissionCode()).collect(Collectors.toList()));
            SysUserDetail loginUser =  fillOfficeInfo(sysUser);
            loginUser.setToken(token);
            ThreadLocalUtils.put(ThreadLocalUtils.USERID_KEY,sysUser.getId());
            return loginUser;
        } catch (AuthenticationException e) {
            throw new BadCredentialsException("Invalid username/password supplied");
        }
    }

    public SysUser whoami(HttpServletRequest req) {
        return this.getSysUserByLoginName(jwtTokenProvider.getUsername(jwtTokenProvider.resolveToken(req)));
    }

    public static void main(String[] args) {
        String pwd = "admin";
        PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
        String passencode = passwordEncoder.encode("admin");
        System.out.println(passencode);
        //{bcrypt}$2a$10$.UVEQnZqTc3xTJCk3PIXFekHHFdJnv/SVm9xa2iX1TshM.INNMe/e
        //{bcrypt}$2a$10$0wOwSg/BnCHvC2Qd5biSVOmH8oJvyySJ0CsQj6LipWkisUTqxp4ey
        boolean result = passwordEncoder.matches(pwd, passencode);
        System.out.println(result);
    }
}
