package com.phuag.sample.admin.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.phuag.sample.admin.api.entity.SysArea;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by vvvvvv on 2018/7/30.
 */
@Repository(value="sysAreaMapper")
@Mapper
public interface SysAreaMapper extends BaseMapper<SysArea> {
    /**
     *  回显Tree的地域
     */
    List<String> getAreaid(String id);
}
