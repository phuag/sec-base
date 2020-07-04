package com.phuag.sample.common.core.enums;

/**
 * Created by Administrator on 2018/7/18.
 */
public enum ResultEnum {
    UNKNOWN_ERROR("未知错误"),
    QUERY_OBJECT_IS_NULL("操作对象不存在"),
    USERNAME_OR_PASSWORD_ERROR("账号或密码不正确"),
    NOT_ALLOWED_LOGIN("该账号不允许登录"),
    ACCOUNT_AUTHENTICATION_FAIL("账户验证失败"),
    ACCOUNT_LOCKED("账号已被锁定,请联系管理员"),
    VERIFY_OLD_PASSWORD_FAIL("原密码验证失败"),
    AUTH_DATA_TYPE_ERROR("数据权限接口，且不能为NULL"),
    SERVICE_CONNECT_FAIL("服务连接失败,请确定远程服务已启动"),
    SERVICE_NOT_FINED("服务未找到,请确定远程服务已启动"),
    SERVICE_DATA_ERROR("认证服务返回数据异常"),
    ANALYSIS_AG_XML_ERROR("解析安管返回XML错误"),
    DATABASE_PATH_ERROR("数据库安装路径配置错误"),
    DATABASE_BACKUP_ERROR("数据库备份失败"),
    DATABASE_RECOVER_ERROR("数据库恢复失败"),
    GET_TIMER_TASK_ERROR("获取定时任务CronTrigger出现异常"),
    CREATE_TIMER_TASK_FAIL("创建定时任务失败"),
    UPDATE_TIMER_TASK_FAIL("更新定时任务失败"),
    PAUSE_TIMER_TASK_FAIL("暂停定时任务失败"),
    RECOVER_TIMER_TASK_FAIL("暂停定时任务失败"),
    DELETE_TIMER_TASK_FAIL("删除定时任务失败"),
    EXEC_TIMER_TASK_FAIL("立即执行定时任务失败");
    private String msg;

    ResultEnum(String msg) {
        this.msg = msg;
    }


    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
