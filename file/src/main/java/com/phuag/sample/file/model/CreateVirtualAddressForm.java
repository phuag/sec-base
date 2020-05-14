package com.phuag.sample.file.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 创建虚拟地址请求实体
 *
 */
@Data
@NoArgsConstructor
public class CreateVirtualAddressForm implements Serializable {
    private String fid;
    private String uid;
    private String fileName;
    private String md5;
    private String fileType;
    private String fileSizem;
    private String parentPath;
}
