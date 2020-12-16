package com.phuag.sample.admin.api.model;

import com.phuag.sample.admin.api.entity.SysMenu;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

/**
 * @author phuag
 * @date 2018/08/27
 */
@NoArgsConstructor
@Data
public class SysRoleDetail implements Serializable {

    private String id;

    private String officeId;

    /**
    * 角色名称
    */
    private String name;
    /**
     * 创建者
     */
    private String createPerson;

    /**
     * 英文名称
     */
    private String enname;

    /**
     *权限类型
     */
    private String roleType;


    /**
     * 是否是系统数据
     */
    private String isSys;
    /**
     * 对应的菜单名字
     */
    private String menuname;

    /**
     * 用户id
     */
    private String userId;
    /**
     * 用户名称
     */
    private String userName;

    /**
     * 是否是可用
     */
    private String useable;

    /**
     * 菜单集合
     */
    private List<SysMenu> menus;

}

