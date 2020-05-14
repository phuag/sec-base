package com.phuag.sample.auth.model;

import lombok.Data;

/**
 * @author lihuadong
 * @date 2018/8/14.
 * 界面的操作按钮
 */
@Data
public class MenuPermission {
    /**
     * 功能按钮id
     */
    private String id;

    /**
     * 权限名称
     */
    private String permission;
    /**
     * 是否必须
     */
    private String isRequired;
}
