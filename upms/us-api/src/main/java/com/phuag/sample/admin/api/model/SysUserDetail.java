package com.phuag.sample.admin.api.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.phuag.sample.admin.api.entity.SysOffice;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author vvvvvv
 * @date 2017/12/27
 */
@NoArgsConstructor
@Data
public class SysUserDetail implements Serializable {
    private String id;

    /**
     * 归属部门
     */
    private SysOffice office;

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
    private Date loginDate;

    /**
     * 是否允许登录
     */
    private String loginFlag;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createDate;

    /**
    * 拥有角色Id集
    */
    private String[] roles;

    /**
     * 权限标识集合
     */
    private String[] permissions;

    /**
     * 对应的token
     */
    private String token;
}
