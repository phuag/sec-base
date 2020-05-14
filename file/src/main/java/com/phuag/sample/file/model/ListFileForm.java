package com.phuag.sample.file.model;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 文件列表请求实体
 *
 * @author: quhailong
 * @date: 2019/9/24
 */
@Data
@NoArgsConstructor
public class ListFileForm {
    private String type;
    private String uid;
    private String path;
    private Integer page;
    private String order;
    private Integer desc;
}
