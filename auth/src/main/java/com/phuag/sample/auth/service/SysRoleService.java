package com.phuag.sample.auth.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.phuag.sample.auth.dao.SysRoleMapper;
import com.phuag.sample.auth.domain.SysRole;
import com.phuag.sample.auth.model.SysRoleForm;
import com.phuag.sample.auth.util.UserUtil;
import com.phuag.sample.common.persistence.service.CrudService;
import com.phuag.sample.common.util.DTOUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import java.util.List;

/**
 * @author lihuadong 2017/12/26.
 */
@Service
@Transactional(rollbackFor = Exception.class)
@Slf4j
public class SysRoleService extends CrudService<SysRoleMapper, SysRole> {

    public void saveSysRole(SysRoleForm form) {
        SysRole sysRole = DTOUtil.map(form,SysRole.class);
        sysRole.preInsert(getOprId());
        String roleId = sysRole.getId();
        int result = dao.insert(sysRole);
        // 保存角色和菜单对应关系
        // 获取界面选中的权限（角色能够操作的按钮）
        List permissions = form.getPermissions();
        // 根据权限按钮查询能够操作的菜单
        if (result == 1) {
            //保存集合
            dao.insertRoleMenu(roleId, permissions);
        }
    }
    public void updateSysRole(String sysRoleId, SysRoleForm form) {
        Assert.hasText(sysRoleId, "sysUser id can not be null");
        SysRole sysRole = dao.selectById(sysRoleId);
        DTOUtil.mapTo(form, sysRole);
        // 保存角色相关信息
        save(sysRole);
        List permissions = form.getPermissions();
        //1、先删除 角色的菜单&权限
        dao.deleteRoleMenu(sysRole.getId());
        //2、再保存
        dao.insertRoleMenu(sysRole.getId(), permissions);
    }

    public Page<SysRole> roleDetailList(Pageable pageable, String keyword) {
        Page<SysRole> page = new Page<>(pageable.getPageNumber(),pageable.getPageSize());
        Page<SysRole> list =  dao.roleDetailList(page,keyword);
        return list;
    }

    /**
     * 单个删除
     * @param roleId
     * @return
     */
    public int deleteRole(String roleId){
        // 1、先删除 角色的菜单&权限
        dao.deleteRoleMenu(roleId);
        // 再删除角色
        return dao.deleteById(roleId);
    }

    /**
     * 批量删除
     * @param ids
     */
    public void batchDeleteRole(String[] ids){
        for (String id : ids) {
            deleteRole(id);
        }
    }

    @Override
    public String getOprId() {
        return UserUtil.getUser().getId();
    }
}
