package com.phuag.sample.admin.api.entity;

import com.phuag.sample.common.core.persistence.domain.DataEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author lihuadong
 * @date 2018/08/14
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class SysMenu extends DataEntity<SysMenu> {

    private String name;

    private String code;

    private String permission;

    private String permissionCode;

    private String isRequired;

}