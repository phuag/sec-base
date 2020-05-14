package com.phuag.sample.auth.model;

import lombok.Data;

/**
 * @author lihuadong
 * @date 2018/07/21
 */
@Data
public class UserPwdForm {
    /**
     * 用户ID
     */
    private String userId;
    /**
     * 用户明文密码
     */
    private String oldPassword;
    /**
     *用户明文新密码
     */
    private String newPassword;
    /**
     * 用户明文确认密码
     */
    private String confirmNewPassword;
}
