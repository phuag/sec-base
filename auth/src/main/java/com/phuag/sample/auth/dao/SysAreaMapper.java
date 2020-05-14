package com.phuag.sample.auth.dao;

import com.phuag.sample.auth.domain.SysArea;
import com.phuag.sample.common.persistence.dao.CrudDao;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by vvvvvv on 2018/7/30.
 */
@Repository(value="sysAreaMapper")
@Mapper
public interface SysAreaMapper extends CrudDao<SysArea> {
    /**
     *  回显Tree的地域
     */
    List<String> getAreaid(String id);
}
