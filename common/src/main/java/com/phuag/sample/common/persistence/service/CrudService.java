/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.phuag.sample.common.persistence.service;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.phuag.sample.common.persistence.dao.CrudDao;
import com.phuag.sample.common.persistence.domain.DataEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;

import javax.security.auth.Subject;
import java.util.List;

/**
 * Service基类
 *
 * @author ThinkGem
 * @version 2014-05-16
 */

public abstract class CrudService<D extends CrudDao<T>, T extends DataEntity<T>> {

    /**
     * 持久层对象
     */
    @Autowired
    protected D dao;

    public abstract String getOprId();

    /**
     * 获取单条数据
     *
     * @param id
     * @return
     */
    @Transactional(readOnly = true,rollbackFor = Exception.class)
    public T select(String id) {
        return dao.selectById(id);
    }

    @Transactional(readOnly = true,rollbackFor = Exception.class)
    public List<T> selectAll(){
        return dao.selectList(null);
    }

    /**
     * 获取单条数据
     *
     * @param queryWrapper
     * @return
     */
    @Transactional(readOnly = true,rollbackFor = Exception.class)
    public T selectOne(Wrapper<T> queryWrapper) {
        return dao.selectOne(queryWrapper);
    }

    /**
     * 查询列表数据
     *
     * @param queryWrapper
     * @return
     */
    @Transactional(readOnly = true,rollbackFor = Exception.class)
    public List<T> selectList(Wrapper<T> queryWrapper) {
        return dao.selectList(queryWrapper);
    }

    /**
     * 查询分页数据
     *
     * @param pageable   分页对象
     * @param queryWrapper
     * @return
     */
    @Transactional(readOnly = true,rollbackFor = Exception.class)
    public Page<T> findPage(Pageable pageable, Wrapper<T> queryWrapper) {
        Page<T> page = new Page<>(pageable.getPageNumber(), pageable.getPageSize());
        return dao.selectPage(page,queryWrapper);
    }

    /**
     * 保存数据（插入或更新）
     *
     * @param entity
     */
    @Transactional(rollbackFor = Exception.class)
    public int save(T entity) {
        String oprId = getOprId();
        if (entity.isNewRecord()) {
            entity.preInsert(oprId);
            return dao.insert(entity);
        } else {
            entity.preUpdate(oprId);
            return dao.updateById(entity);
        }
    }

    /**
     * 删除数据
     *
     * @param deleteWrapper 删除的条件封装在对象中
     * @return 数据库受影响的行数,所以大于0成功,等于0失败
     */
    @Transactional(readOnly = false,rollbackFor = Exception.class)
    public int delete(Wrapper<T> deleteWrapper) {
        return dao.delete(deleteWrapper);
    }

    /**
     * 逻辑删除,根据主键删除数据
     *
     * @param id 需要删除对象的主键值
     * @return 数据库受影响的行数,所以大于0成功，等于0失败
     */
    @Transactional(readOnly = false,rollbackFor = Exception.class)
    public int delete(String id) {
        return dao.deleteById(id);
    }



}
