package com.phuag.sample.admin.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.phuag.sample.admin.api.entity.SysMenu;
import com.phuag.sample.admin.api.entity.SysOffice;
import com.phuag.sample.admin.api.entity.SysRole;
import com.phuag.sample.admin.api.entity.SysUser;
import com.phuag.sample.admin.api.model.SysUserForm;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

/**
 * @author vvvvvv
 */
@Repository(value="sysUserMapper")
@Mapper
public interface SysUserMapper extends BaseMapper<SysUser> {

    /**
     * 根据登录名称查询系统用户
     * @param loginName
     * @return
     */
    @Select("SELECT * FROM sys_user " +
            "WHERE del_flag = ${@com.phuag.sample.common.persistence.domain.BaseEntity@DEL_FLAG_NORMAL}  " +
            "and login_name= #{loginName,jdbcType=VARCHAR}")
    Optional<SysUser> selectSysUserByLoginName(String loginName);

    /**
     * 根据用户查询角色
     * @param user
     * @return
     */
    @Select("SELECT * FROM sys_role " +
            "WHERE del_flag = ${@com.phuag.sample.common.persistence.domain.BaseEntity@DEL_FLAG_NORMAL}  " +
            "and id in " +
            "(select role_id from sys_user_role where user_id = #{id,jdbcType=VARCHAR})")
    List<SysRole> getSysUserRolesByUser(SysUser user);

    @Select("SELECT * FROM sys_office " +
            "WHERE del_flag = ${@com.phuag.sample.common.persistence.domain.BaseEntity@DEL_FLAG_NORMAL}  " +
            "and id = #{officeId,jdbcType=VARCHAR}")
    SysOffice getSysUserOffice(SysUser user);

    /**
     * 根据单位和用户名字查询用户
     * @param officeId 单位Id
     * @param keyword 名字关键字
     * @return
     */
    Page<SysUser> getByOfficeAndName(Page<SysUser> page, @Param("officeId") String officeId, @Param("keyword")String keyword);


    /**
    * 在sys_user_role中生成用户对应角色关系
    */
    int addUserRole(SysUserForm form);

    /**
     * 查询时把所有的对应角色封装进入SysUserDatail
     * @param id
     * @return
     */
    List<String> getRoles(String id);

    @Select("SELECT * FROM sys_menu " +
            "WHERE del_flag = ${@com.phuag.sample.common.persistence.domain.BaseEntity@DEL_FLAG_NORMAL}  " +
            "and id in (" +
            "select t.menu_id from sys_role_menu t, sys_user_role w " +
            "where w.role_id = t.role_id and w.user_id =#{userId,jdbcType=VARCHAR}" +
            ")")
    List<SysMenu> getSysMenu(String userId);

    /**
     * 用户登录后更新最后登录的ip和时间
     * @param user
     * @return 更新操作影响行数
     */
    @Update("UPDATE sys_user SET " +
            "login_ip = #{loginIp}, " +
            "login_Date = #{loginDate} " +
            "WHERE id = #{id}")
    int updateLoginInfo(SysUser user);
}