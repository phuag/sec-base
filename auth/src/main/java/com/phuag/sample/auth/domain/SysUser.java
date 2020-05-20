package com.phuag.sample.auth.domain;

import com.phuag.sample.common.persistence.domain.DataEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.Date;

/**
 * @author vvvvvv
 */
@NoArgsConstructor
@Data
@EqualsAndHashCode(callSuper = true)
public class SysUser extends DataEntity<SysUser> implements UserDetails {
    /**
     * 归属公司
     */
    private String companyId;
    /**
     * 归属部门
     */
    private String officeId;
    /**
     * 登录名
     */
    private String loginName;
    /**
     * 密码
     */
    private String password;
    /**
     * 工号
     */
    private String no;
    /**
     * 姓名
     */
    private String name;
    /**
     * 性别
     */
    private String sex;
    /**
     * 生日
     */
    private Date birth;
    /**
     * 邮箱
     */
    private String email;
    /**
     * 电话
     */
    private String phone;
    /**
     * 手机
     */
    private String mobile;
    /**
     * 用户类型
     */
    private String userType;
    /**
     * 头像
     */
    private String photo;
    /**
     * 最后登陆IP
     */
    private String loginIp;
    /**
     * 最后登录日期
     */
    private Date loginDate;
    /**
     * 是否允许登陆
     */
    private String loginFlag;


    public boolean isAdmin() {
        return isAdmin(this.id);
    }

    public static boolean isAdmin(String id) {
        return id != null && "1".equals(id);
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return null;
    }

    @Override
    public String getUsername() {
        return loginName;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}