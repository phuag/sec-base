package com.phuag.sample.file.domain;

import com.phuag.sample.common.persistence.domain.DataEntity;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class SecFile extends DataEntity<SecFile> {

    private String fileId;

    private String originalName;

    private Integer fileSize;

    private Integer fileType;

    private String fileLocation;

    private String fileMd5;

}
