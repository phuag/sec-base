package com.phuag.sample.auth.service;

import com.phuag.sample.auth.dao.SysAreaMapper;
import com.phuag.sample.auth.domain.SysArea;
import com.phuag.sample.auth.util.UserUtil;
import com.phuag.sample.common.persistence.service.CrudService;
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
        List<String> list =  dao.getAreaid(id);
        return list;
    }
}




