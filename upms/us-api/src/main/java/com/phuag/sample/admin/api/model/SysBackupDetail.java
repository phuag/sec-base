package com.phuag.sample.admin.api.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.Date;

/**
 * @author lihuadong
 * @date 2018/11/13.
 */
@Data
@EqualsAndHashCode
public class SysBackupDetail  implements Serializable {
    private String id;
    private String fileName;
    private String fileSize;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date createDate;
    private String createBy;
    private String remarks;
}
