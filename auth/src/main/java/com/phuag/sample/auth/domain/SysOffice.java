package com.phuag.sample.auth.domain;

import com.phuag.sample.common.persistence.domain.TreeEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * Created by vvvvvv on 2017/12/28.
 */
@NoArgsConstructor
@Data
@EqualsAndHashCode(callSuper = true)
public class SysOffice extends TreeEntity<SysOffice> {
    /**
    *  机构编码
    */
    private String code;
    /**
     *  机构类型（1：公司；2：部门；3：小组）
     */
    private String type;
    /**
     * 机构等级（1：一级；2：二级；3：三级；4：四级）
     */
    private String grade;
    /**
     * 联系地址
     */
    private String address;
    /**
     * 邮政编码
     */
    private String zipCode;
    /**
     * 负责人
     */
    private String master;
    /**
     * 电话
     */
    private String phone;
    /**
     * 传真
     */
    private String fax;
    /**
     * 邮箱
     */
    private String email;
    /**
     * 是否可用
     */
    private String useable;

}
