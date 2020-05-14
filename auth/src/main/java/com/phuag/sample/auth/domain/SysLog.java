package com.phuag.sample.auth.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import com.phuag.sample.common.persistence.domain.DataEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * Created by vvvvvv on 2017/12/4.
 */
@NoArgsConstructor
@Data
@EqualsAndHashCode(callSuper = true)
public class SysLog extends DataEntity<SysLog> {

    /**
     *  日志类型（1：接入日志；2：错误日志）
     */
    private String type;
    /**
     *  日志标题
     */
    private String title;
    /**
     * 操作用户的IP地址
     */
    private String remoteAddr;
    /**
     * 操作的URI
     */
    private String requestUri;
    /**
     * 操作的方式
     */
    private String method;
    /**
     * 操作提交的数据
     */
    private String params;
    /**
     * 操作用户代理信息
     */
    private String userAgent;
    /**
     * 异常信息
     */
    private String exception;

    /**
     * 开始日期
     */
    @TableField(exist=false)
    private Date beginDate;
    /**
     * 结束日期
     */
    @TableField(exist=false)
    private Date endDate;
    /**
    * 日志类型（1：接入日志；2：错误日志）
    */
    public static final String TYPE_ACCESS = "1";
    public static final String TYPE_EXCEPTION = "2";
}
