package com.phuag.sample.admin.api.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.phuag.sample.common.core.persistence.domain.DataEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @author vvvvvv
 */
@NoArgsConstructor
@Data
@EqualsAndHashCode(callSuper = true)
public class SysUser extends DataEntity<SysUser> {
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
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
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
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
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

}