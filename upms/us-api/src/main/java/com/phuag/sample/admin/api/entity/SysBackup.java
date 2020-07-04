package com.phuag.sample.admin.api.entity;

import com.phuag.sample.common.core.persistence.domain.DataEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author lihuadong
 * @date 2018/11/13.
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class SysBackup  extends DataEntity<SysBackup> {
    private String fileName;
    private String fileSize;
}
