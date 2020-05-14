package com.phuag.sample.file.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 秒传请求实体
 *
 */
@Data
@NoArgsConstructor
public class QuickUploadFileForm implements Serializable {
    private String fid;
    private String fileName;
    private String md5;
    private String uid;
    private String parentPath;
}
