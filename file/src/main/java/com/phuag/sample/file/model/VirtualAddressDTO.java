package com.phuag.sample.file.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 虚拟地址返回实体
 *
 * @author: quhailong
 * @date: 2019/9/25
 */
@Data
@NoArgsConstructor
public class VirtualAddressDTO {

    private String uuid;

    private String fileId;

    private String userId;

    private String fileName;

    private Integer addrType;

    private String fileMd5;

    private String parentPath;

    private Integer fileSize;

    private Integer dirWhether;

    private Date createTime;

    private Date updateTime;

}
