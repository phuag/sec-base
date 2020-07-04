package com.phuag.sample.admin.api.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

@NoArgsConstructor
@Data
public class SysRoleForm implements Serializable {


    private String id;


    /**
    *角色名称
    */
    private String name;

    /**
     * 权限集合
     */
    private List<String> permissions;

    /**
     *是否是可用
     */
    private String useable;




    }