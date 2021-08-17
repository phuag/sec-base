package com.phuag.ds.datasource.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.phuag.ds.datasource.entity.DataSourceModel;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * @author phuag
 */
@Repository(value="dataSourceModelMapper")
@Mapper
public interface DataSourceModelMapper extends BaseMapper<DataSourceModel> {
}
