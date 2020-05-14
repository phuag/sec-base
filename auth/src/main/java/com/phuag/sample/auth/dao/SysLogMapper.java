package com.phuag.sample.auth.dao;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.phuag.sample.auth.domain.SysLog;
import com.phuag.sample.common.persistence.dao.CrudDao;
import com.phuag.sample.auth.vo.LogDateVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * Created by vvvvvv on 2017/12/4.
 */
@Repository(value="sysLogMapper")
@Mapper
public interface SysLogMapper extends CrudDao<SysLog> {

    IPage<SysLog> getAllLog(Page<?> page, LogDateVO logDateVO);

}
