package com.phuag.sample.common.persistence;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.phuag.sample.common.util.ThreadLocalUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;

import java.time.LocalDateTime;

/**
 * @author phuag
 */
@Slf4j
public class AuditMetaObjectHandler implements MetaObjectHandler {
    @Override
    public void insertFill(MetaObject metaObject) {
        log.info("start insert fill ....");
        this.strictInsertFill(metaObject, "createTime", LocalDateTime.class, LocalDateTime.now());
        //获取用户，如果使用SpringSecurity的话可以从SecurityContext中获取
        String userId = ThreadLocalUtils.get(ThreadLocalUtils.USERID_KEY);
        this.strictUpdateFill(metaObject, "createBy", String.class, userId);
        this.strictUpdateFill(metaObject, "updateBy", String.class, userId);
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        log.info("start update fill ....");
        this.strictUpdateFill(metaObject, "updateDate", LocalDateTime.class, LocalDateTime.now());
        //获取用户，如果使用SpringSecurity的话可以从SecurityContext中获取
        String userId = ThreadLocalUtils.get(ThreadLocalUtils.USERID_KEY);
        this.strictUpdateFill(metaObject, "updateBy", String.class, userId);
    }
}
