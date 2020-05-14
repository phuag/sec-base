package com.phuag.sample.auth.dao;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.phuag.sample.auth.domain.SysRole;
import com.phuag.sample.common.persistence.dao.CrudDao;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author vvvvvv
 */
@Repository(value="sysRoleMapper")
@Mapper
public interface SysRoleMapper extends CrudDao<SysRole> {

    /**
     * 查询角色列表
     * @param keyword
     * @return
     */
    Page<SysRole> roleDetailList(Page<?> page, @Param("keyword") String keyword);

    /**
     * 保存角色和菜单的关系
     * @param roleId
     * @param menuIds
     */
    void insertRoleMenu(@Param("roleId") String roleId, @Param("menuIds") List menuIds);

    /**
     * 根据角色删除权限
     * @param roleId
     */
    @Delete("DELETE FROM sys_role_menu WHERE role_id = #{roleId}")
    void deleteRoleMenu(@Param("roleId") String roleId);


    /**
     * 根据角色id 查询所拥有的区域Id
     * @param roleIdList 角色Id
     * @return
     */
     List<String> queryAreaIdList(List roleIdList);
}