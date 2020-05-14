package com.phuag.sample.auth.domain;

import com.phuag.sample.common.persistence.domain.DataEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;

import java.math.BigDecimal;

/**
 * Created by vvvvvv on 2018/7/30.
 */
@NoArgsConstructor
@Data
@EqualsAndHashCode(callSuper = true)
public class SysArea extends DataEntity<SysArea> {
    /**
     * 域名等级
     */
    private String parentid;
    /**
     * 域的上级
     */
    private String parentids;
    /**
     * 域名名字
     */
    @Length(min=1, max=1)
    private String name;
    /**
     *
     */
    private BigDecimal sort;
    /**
     * 域的编号
     */
    private String code;
    /**
     *
     */
    private Character type;



}
