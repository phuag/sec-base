package com.phuag.sample.auth.configuration;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @author lihuadong
 * @date 2018/11/20.
 */
@ConfigurationProperties(prefix ="sysbackup")
@Data
@Component
public class SysBackupProperties {
    private String dbInstallPath = "C:\\Program Files\\MySql\\bin\\";
    private String dbIp = "localhost";
    private String dbName = "test";
}
