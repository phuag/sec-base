package com.phuag.sample.common.core.persistence.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.phuag.sample.common.core.persistence.domain.TreeEntity;

import java.util.List;

/**
 * DAO支持类实现
 * @author ThinkGem
 * @version 2014-05-16
 * @param <T>
 */
public interface TreeDao<T extends TreeEntity<T>> extends BaseMapper<T> {

	/**
	 * 找到所有子节点
	 * @param parentIdLike,parentIds值进行查询
	 * @return
	 */

	public List<T> selectByParentIdsLike(String parentIdLike);

	/**
	 * 更新所有父节点字段
	 * @param entity
	 * @return
	 */
	public int updateParentIds(T entity);
	
}