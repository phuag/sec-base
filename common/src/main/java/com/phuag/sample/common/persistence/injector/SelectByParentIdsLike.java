package com.phuag.sample.common.persistence.injector;

import com.baomidou.mybatisplus.core.metadata.TableInfo;
import org.apache.ibatis.mapping.MappedStatement;

/**
 * @author phuag
 */
public class SelectByParentIdsLike extends com.baomidou.mybatisplus.core.injector.AbstractMethod {
    @Override
    public MappedStatement injectMappedStatement(Class<?> mapperClass, Class<?> modelClass, TableInfo tableInfo) {
        //TODO 添加selectByParentIdsLike这个公用方法的sql构造方法
        return null;
    }
}
