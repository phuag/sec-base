package com.phuag.sample.file.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;

/**
 * 上传文件请求实体
 *
 * @author: quhailong
 * @date: 2019/9/25
 */
@Data
@NoArgsConstructor
public class UploadFileForm implements Serializable {
    private String fid;
    private MultipartFile file;
    private String uid;
    private String parentPath;
}
