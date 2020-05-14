package com.phuag.sample.common.persistence.injector;

import com.baomidou.mybatisplus.core.injector.AbstractMethod;
import com.baomidou.mybatisplus.core.metadata.TableInfo;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.SqlSource;

/**
 * @author phuag
 */
public class UpdateParentIds extends AbstractMethod {
    @Override
    public MappedStatement injectMappedStatement(Class<?> mapperClass, Class<?> modelClass, TableInfo tableInfo) {
        boolean logicDelete = tableInfo.isLogicDelete();
        String additional = this.optlockVersion(tableInfo) + tableInfo.getLogicDeleteSql(true, true);
        /* 执行 SQL ，动态 SQL 参考类 SqlMethod */
        StringBuffer sb = new StringBuffer("update ");
        sb.append(tableInfo.getTableName());
//        sb.append(this.sqlSet(logicDelete, false, tableInfo, false, "et", "et."));
        sb.append("set parent_ids = #{parentIds}");
        sb.append("et.").append(tableInfo.getKeyProperty());
        sb.append(additional);

        /* mapper 接口方法名一致 */
        String method = "updateParentIds";
        SqlSource sqlSource = languageDriver.createSqlSource(configuration, sb.toString(), modelClass);
        return this.addUpdateMappedStatement(mapperClass,mapperClass,method,sqlSource);
    }
}
