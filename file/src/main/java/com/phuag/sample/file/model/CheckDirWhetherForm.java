package com.phuag.sample.file.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 检查文件夹是否存在请求实体
 *
 * @author: quhailong
 * @date: 2019/9/25
 */
@Data
@NoArgsConstructor
public class CheckDirWhetherForm implements Serializable {
    private String uid;
    private String dirName;
    private String parentPath;
}
