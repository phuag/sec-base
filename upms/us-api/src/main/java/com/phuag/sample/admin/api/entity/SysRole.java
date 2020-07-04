package com.phuag.sample.admin.api.entity;

import com.phuag.sample.common.core.persistence.domain.DataEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@EqualsAndHashCode(callSuper = true)
public class SysRole extends DataEntity<SysRole> {


    private String officeId;
    /**
    *  角色名称
    */
    private String name;

    /**
     * 英文名称
     */
    private String enname;

    /**
     * 权限类型
     */
    private String roleType;

    /**
     * 数据范围
     */
    private String dataScope;

    /**
     * 是否是系统数据
     */
    private String isSys;

    /**
     * 是否是可用
     */
    private String useable;


    }