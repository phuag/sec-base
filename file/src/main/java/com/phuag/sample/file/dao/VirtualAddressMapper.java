package com.phuag.sample.file.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.phuag.sample.file.domain.VirtualAddress;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author phuag
 */
public interface VirtualAddressMapper  extends BaseMapper<VirtualAddress> {
    /**
     * 获取虚拟地址信息
     */
    List<VirtualAddress> listVirtualAddress(@Param("userId") String userId, @Param("parentPath") String parentPath, @Param("addrType") Integer addrType);

    /**
     * 搜索文件
     */
    List<VirtualAddress> listVirtualAddressLikeFileName(@Param("userId") String userId, @Param("fileName") String fileName);

    /**
     * 判断重名
     */
    Integer checkVirtualAddress(@Param("userId") String userId, @Param("parentPath") String parentPath, @Param("addrType") Integer addrType, @Param("fileName") String fileName);

    /**
     * 获取虚拟地址信息
     */
    VirtualAddress getVirtualAddress(@Param("uuid") String uuid);

    /**
     * 修改虚拟地址信息
     */
    Integer updateVirtualAddress(VirtualAddress virtualAddress);

    /**
     * 获取父路径相关的虚拟地址
     */
    List<VirtualAddress> listVirtualAddressLikeFilePath(@Param("userId") String userId, @Param("parentPath") String parentPath);

    /**
     * 删除虚拟地址
     */
    Integer removeVirtualAddress(@Param("uuid") String uuid);


    /**
     * 保存虚拟地址
     */
    Integer saveVirtualAddress(VirtualAddress virtualAddress);
}
