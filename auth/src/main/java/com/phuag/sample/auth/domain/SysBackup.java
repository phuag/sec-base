package com.phuag.sample.auth.domain;

import com.phuag.sample.common.persistence.domain.DataEntity;
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
