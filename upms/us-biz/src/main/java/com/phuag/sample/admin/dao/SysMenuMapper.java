package com.phuag.sample.admin.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.phuag.sample.admin.api.entity.SysMenu;
import com.phuag.sample.admin.api.model.MenuDetail;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;


/**
 * @author phuag
 */
@Mapper
@Repository(value="sysMenuMapper")
public interface SysMenuMapper extends BaseMapper<SysMenu> {


  /**
   * 查询menu 按并格式化数据
   * @return
   */
  List<MenuDetail> queryMenu();

}