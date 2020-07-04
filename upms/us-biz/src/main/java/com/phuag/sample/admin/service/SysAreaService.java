package com.phuag.sample.admin.service;

import com.phuag.sample.admin.api.entity.SysArea;
import com.phuag.sample.admin.dao.SysAreaMapper;
import com.phuag.sample.common.core.persistence.service.CrudService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by vvvvvv on 2018/7/30.
 */
@Service
@Slf4j
public class SysAreaService extends CrudService<SysAreaMapper, SysArea> {

    /**
     * 编辑返回名字
     */
    public List<String> getAreaid(String id){
        List<String> list =  baseMapper.getAreaid(id);
        return list;
    }
}




