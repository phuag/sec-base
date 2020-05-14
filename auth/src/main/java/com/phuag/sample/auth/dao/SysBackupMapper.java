package com.phuag.sample.auth.dao;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.phuag.sample.auth.domain.SysBackup;
import com.phuag.sample.common.persistence.dao.CrudDao;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * @author lihuadong
 * @date 2018/11/13.
 */
@Repository(value = "sysBackupMapper")
@Mapper
public interface SysBackupMapper extends CrudDao<SysBackup> {
    /**
     * 列表展示查询
     * @param keyword
     * @return
     */
    IPage<SysBackup> queryList(Page page, @Param("keyword") String keyword);
}
