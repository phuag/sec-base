package com.phuag.ds.datasource.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.phuag.ds.datasource.entity.DataSourceOwner;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * @author phuag
 */
@Repository(value="dataSourceOwenerMapper")
@Mapper
public interface DataSourceOwnerMapper extends BaseMapper<DataSourceOwner> {
}
