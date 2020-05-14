package com.phuag.sample.auth.service;

import com.phuag.sample.auth.dao.SysMenuMapper;
import com.phuag.sample.auth.domain.SysMenu;
import com.phuag.sample.auth.model.MenuDetail;
import com.phuag.sample.auth.util.UserUtil;
import com.phuag.sample.common.persistence.service.CrudService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author lihuadong
 * @date 2018/10/22
 */
@Service
@Slf4j
public class SysMenuService extends CrudService<SysMenuMapper, SysMenu> {


    /**
     * 查询菜单及其对应的功能按钮
     * @return
     */
    public List<MenuDetail> queryMenu(){
        return dao.queryMenu();
    }
    /**
     * 编辑返回菜单功能
     */
    public List<String> getMenuid(String id){
        List<String> list = new ArrayList<>();// dao.getMenuid(id);
        return list;
    }

    @Override
    public String getOprId() {
        return UserUtil.getUser().getId();
    }
}
