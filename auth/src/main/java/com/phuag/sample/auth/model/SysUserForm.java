package com.phuag.sample.auth.model;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @author vvvvvv
 * @date 2018/7/6
 */

@Data
public class SysUserForm implements Serializable{

    private static final long serialVersionUID = 1L;

    /*
    * 角色对应id
    */

    private String id;
    /**
     * 归属部门id
     */
    private String officeId;

    /**
     * 登录名
     */
    private String loginName;

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
     * 用户类型
     */
    private String userType;

    /**
     * 是否允许入网
     */
    private String loginFlag;
    /**
    * 对应的role的id
    */
    private List<String> roles;

   /**
   * 临时封装角色，每次一个角色，循环sqL语句
   */
   private String role;

}
