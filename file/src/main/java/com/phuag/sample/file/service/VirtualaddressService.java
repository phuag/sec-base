package com.phuag.sample.file.service;

import com.phuag.sample.common.persistence.service.CrudService;
import com.phuag.sample.common.util.IdGen;
import com.phuag.sample.common.util.JSONUtils;
import com.phuag.sample.file.dao.VirtualAddressMapper;
import com.phuag.sample.file.domain.VirtualAddress;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.regex.Pattern;


/**
 * @author phuag
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class VirtualaddressService extends CrudService<VirtualAddressMapper, VirtualAddress> {

    /**
     * 获取虚拟地址信息
     */
    public List<VirtualAddress> listVirtualAddress(String userId, String parentPath, Integer addrType) {
        return dao.listVirtualAddress(userId, parentPath, addrType);
    }

    /**
     * 搜索文件
     */
    public List<VirtualAddress> listVirtualAddressLikeFileName(String userId, String fileName) {
        return dao.listVirtualAddressLikeFileName(userId, fileName);
    }

    /**
     * 判断重名
     */
    public Integer checkVirtualAddress(String userId, String parentPath, Integer addrType, String fileName) {
        return dao.checkVirtualAddress(userId, parentPath, addrType, fileName);
    }

    /**
     * 获取虚拟地址信息
     */
    public VirtualAddress getVirtualAddress(String uuid) {
        return dao.getVirtualAddress(uuid);
    }

    /**
     * 修改虚拟地址信息
     */
    public Integer updateVirtualAddress(VirtualAddress virtualAddressDO) {
        return dao.updateVirtualAddress(virtualAddressDO);
    }

    /**
     * 获取父路径相关的虚拟地址
     */
    public List<VirtualAddress> listVirtualAddressLikeFilePath(String userId, String parentPath) {
        return dao.listVirtualAddressLikeFilePath(userId, parentPath);
    }

    /**
     * 删除虚拟地址
     */
    public Integer removeVirtualAddress(String uuid) {
        return dao.removeVirtualAddress(uuid);
    }


    /**
     * 创建文件夹数据处理
     */
    public VirtualAddress createDir(String dirName,String parentPath,String userId) {
        if (!Pattern.compile("^[a-zA-Z0-9\u4E00-\u9FA5_]+$").matcher(dirName).matches()) {
//            panResult.error("文件夹长度必须小于20，并且不能包含特殊字符，只能为数字、字母、中文、下划线");
            return null;
        }
        Integer count = dao.checkVirtualAddress(userId, parentPath, null, dirName);
        VirtualAddress virtualAddressDO = new VirtualAddress();
        virtualAddressDO.setAddrType(0);
        virtualAddressDO.setDirWhether(1);
        virtualAddressDO.setCreateDate(new Date());
        virtualAddressDO.setFileId(null);
        if (count > 0) {
            virtualAddressDO.setFileName(dirName + "(" + count + ")");
        } else {
            virtualAddressDO.setFileName(dirName);
        }
        virtualAddressDO.setParentPath(parentPath);
        virtualAddressDO.setUserId(userId);
        virtualAddressDO.setUpdateDate(new Date());
        virtualAddressDO.setUuid(IdGen.uuid());
        dao.saveVirtualAddress(virtualAddressDO);
        return virtualAddressDO;
    }


    @Override
    public String getOprId() {
        return null;
    }
}
