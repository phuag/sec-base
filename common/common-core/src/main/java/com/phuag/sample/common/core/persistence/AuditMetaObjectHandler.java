package com.phuag.sample.common.core.persistence;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.phuag.sample.common.core.util.ThreadLocalUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;

import java.util.Date;

/**
 * @author phuag
 */
@Slf4j
public class AuditMetaObjectHandler implements MetaObjectHandler {

    public void insertFill(MetaObject metaObject) {
        log.info("start insert fill ....");
        this.strictInsertFill(metaObject, "createDate", Date.class, new Date());
        this.strictUpdateFill(metaObject, "updateDate", Date.class, new Date());
        //获取用户，如果使用SpringSecurity的话可以从SecurityContext中获取
        String userId = ThreadLocalUtils.get(ThreadLocalUtils.USER_ID);
        this.strictInsertFill(metaObject, "createBy", String.class, userId);
        this.strictUpdateFill(metaObject, "updateBy", String.class, userId);
    }

    public void updateFill(MetaObject metaObject) {
        log.info("start update fill ....");
        this.strictUpdateFill(metaObject, "updateDate", Date.class, new Date());
        //获取用户，如果使用SpringSecurity的话可以从SecurityContext中获取
        String userId = ThreadLocalUtils.get(ThreadLocalUtils.USER_ID);
        this.strictUpdateFill(metaObject, "updateBy", String.class, userId);
    }
}
