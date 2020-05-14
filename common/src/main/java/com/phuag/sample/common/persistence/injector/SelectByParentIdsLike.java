package com.phuag.sample.common.persistence.injector;

import com.baomidou.mybatisplus.core.metadata.TableInfo;
import org.apache.ibatis.mapping.MappedStatement;

public class SelectByParentIdsLike extends com.baomidou.mybatisplus.core.injector.AbstractMethod {
    @Override
    public MappedStatement injectMappedStatement(Class<?> mapperClass, Class<?> modelClass, TableInfo tableInfo) {
        return null;
    }
}
