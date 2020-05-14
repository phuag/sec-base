package com.phuag.sample.file.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 文件夹列表请求实体
 *
 * @author: quhailong
 * @date: 2019/9/24
 */
@Data
@NoArgsConstructor
public class ListFolderRequest implements Serializable {
    private String uid;
    private String parentPath;
}
