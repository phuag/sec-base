package com.phuag.sample.auth.model;

import lombok.Data;

import java.util.List;

/**
 * @author lihuadong
 * @date 2018/8/14.
 */
@Data
public class MenuDetail {
    /**
     * 菜单id
     */
    private String id;
    /**
     * 菜单名称
     */
    private String name;
    /**
     * 菜单编号
     */
    private String code;
    /**
     * 菜单拥有的按钮
     */
    private List<MenuPermission> buttons;
}
