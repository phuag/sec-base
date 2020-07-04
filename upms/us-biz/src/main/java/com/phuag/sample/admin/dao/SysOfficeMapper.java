package com.phuag.sample.admin.dao;

import com.phuag.sample.admin.api.entity.SysOffice;
import com.phuag.sample.common.core.persistence.dao.TreeDao;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Created by vvvvvv on 2017/12/28.
 */
@Mapper
public interface SysOfficeMapper extends TreeDao<SysOffice> {

    @Select("SELECT * FROM sys_office " +
            "WHERE del_flag = ${@com.phuag.sample.common.persistence.domain.BaseEntity@DEL_FLAG_NORMAL}  " +
            "and parent_id = #{officeId,jdbcType=VARCHAR}")
    List<SysOffice> selectSubOfficeById(String officeId);
}
