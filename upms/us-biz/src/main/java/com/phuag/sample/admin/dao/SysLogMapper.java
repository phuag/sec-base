package com.phuag.sample.admin.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.phuag.sample.admin.api.entity.SysLog;
import com.phuag.sample.admin.api.vo.LogDateVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * Created by vvvvvv on 2017/12/4.
 */
@Repository(value="sysLogMapper")
@Mapper
public interface SysLogMapper extends BaseMapper<SysLog> {

    IPage<SysLog> getAllLog(Page<?> page, LogDateVO logDateVO);

}
