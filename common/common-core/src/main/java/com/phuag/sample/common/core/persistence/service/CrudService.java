package com.phuag.sample.common.core.persistence.service;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.phuag.sample.common.core.persistence.domain.DataEntity;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Service基类
 *
 * @author phuag
 * @version 2020-05-16
 */

public abstract class CrudService<D extends BaseMapper<T>, T extends DataEntity<T>> extends ServiceImpl<D, T> {

    /**
     * 获取单条数据
     *
     * @param queryWrapper
     * @return
     */
    @Transactional(readOnly = true,rollbackFor = Exception.class)
    public T selectOne(Wrapper<T> queryWrapper) {
        return baseMapper.selectOne(queryWrapper);
    }

    /**
     * 查询列表数据
     *
     * @param queryWrapper
     * @return
     */
    @Transactional(readOnly = true,rollbackFor = Exception.class)
    public List<T> selectList(Wrapper<T> queryWrapper) {
        return baseMapper.selectList(queryWrapper);
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
        return baseMapper.selectPage(page,queryWrapper);
    }

    /**
     * 保存数据（插入或更新）
     *
     * @param entity
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean save(T entity) {
        if (entity.isNewRecord()) {
            entity.preInsert();
            return super.save(entity);
        } else {
            entity.preUpdate();
            return super.updateById(entity);
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
        return baseMapper.delete(deleteWrapper);
    }

    /**
     * 逻辑删除,根据主键删除数据
     *
     * @param id 需要删除对象的主键值
     * @return 数据库受影响的行数,所以大于0成功，等于0失败
     */
    @Transactional(readOnly = false,rollbackFor = Exception.class)
    public int delete(String id) {
        return baseMapper.deleteById(id);
    }

}
