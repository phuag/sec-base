package com.phuag.sample.auth.dao;

import com.phuag.sample.auth.domain.SysMenu;
import com.phuag.sample.auth.model.MenuDetail;
import com.phuag.sample.common.persistence.dao.CrudDao;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;


@Mapper
@Repository(value="sysMenuMapper")
public interface SysMenuMapper extends CrudDao<SysMenu> {


  /**
   * 查询menu 按并格式化数据
   * @return
   */
  List<MenuDetail> queryMenu();

}