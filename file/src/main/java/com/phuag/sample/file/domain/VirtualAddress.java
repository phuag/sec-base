package com.phuag.sample.file.domain;

import com.phuag.sample.common.core.persistence.domain.DataEntity;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author phuag
 */
@Data
@NoArgsConstructor
public class VirtualAddress extends DataEntity<VirtualAddress> {

    private String uuid;

    private String fileId;

    private String userId;

    private String fileName;

    private int addrType;

    private String fileMd5;

    private String parentPath;

    private int fileSize;

    private int dirWhether;

}