package com.phuag.ds.datasource.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.phuag.ds.datasource.entity.DataSource;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * @author phuag
 */
@Repository(value="dataSourceMapper")
@Mapper
public interface DataSourceMapper extends BaseMapper<DataSource> {
}
