/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.phuag.sample.common.persistence.service;

import com.phuag.sample.common.persistence.dao.TreeDao;
import com.phuag.sample.common.persistence.domain.TreeEntity;
import com.phuag.sample.common.util.Reflections;
import org.apache.commons.lang3.StringUtils;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Service基类
 *
 * @author ThinkGem
 * @version 2014-05-16
 */
@Transactional(readOnly = true)
public abstract class TreeService<D extends TreeDao<T>, T extends TreeEntity<T>> extends CrudService<D, T> {

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int save(T entity) {
        if (entity.isNewRecord()) {
            entity.preInsert();
            return dao.insert(entity);
        } else {
            entity.preUpdate();
            @SuppressWarnings("unchecked")
            Class<T> entityClass = Reflections.getClassGenricType(getClass(), 1);

            // 如果没有设置父节点，则代表为跟节点，有则获取父节点实体
            T parentEntity = null;
            if (StringUtils.isBlank(entity.getParentId())) {
                entity.setParentId("0");
                try {
                    parentEntity = entityClass.getConstructor(String.class).newInstance("0");
                } catch (Exception e) {
                    throw new ServiceException(e);
                }
            } else {
                parentEntity = super.select(entity.getParentId());
            }

            // 获取修改前的parentIds，用于更新子节点的parentIds
            String oldParentIds = entity.getParentIds();

            // 设置新的父节点串
            entity.setParentIds(parentEntity.getParentIds() + parentEntity.getId() + ",");

            // 更新子节点 parentIds
            String parentIdLike = "%," + entity.getId() + ",%";
            List<T> list = dao.selectByParentIdsLike(parentIdLike);
            for (T e : list) {
                if (e.getParentIds() != null && oldParentIds != null) {
                    e.setParentIds(e.getParentIds().replace(oldParentIds, entity.getParentIds()));
                    preUpdateChild(entity, e);
                    //todo need to test it.
                    dao.updateParentIds(e);
                }
            }
            // 保存或更新实体
            return super.save(entity);
        }
    }

    /**
     * 预留接口，用户更新子节点前调用
     *
     * @param childEntity
     */
    protected void preUpdateChild(T entity, T childEntity) {

    }

}
