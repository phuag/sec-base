package com.phuag.ds.datasource;

import com.phuag.ds.common.datasource.domain.AuthType;
import lombok.Data;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

/**
 * @author davidhua
 * 2018/9/20
 */
@Component
@PropertySource("classpath:datasource-cfg.properties")
@Data
public class Configuration {

    @Value("${store.prefix}")
    private String storePrefix;
    @Value("${store.tmp}")
    private String storeTmp;
    @Value("${store.uri}")
    private String storeUri;

    @Value("${kerberos.krb5.path:krb5.conf}")
    private String kbKrb5Path;

    @Value("${kerberos.principle.hiveMetaStore:hadoop/_HOST@EXAMPLE.COM}")
    private String kbPrincipleHive;

    @Value("${ldap.switch:false}")
    private boolean ldapSwitch;

    @Value("${ldap.url:ldap}")
    private String ldapUrl;

    @Value("${ldap.baseDN:baseDN}")
    private String ldapBaseDn;

    @Value("${data_source.connect.cache.time:600}")
    private Integer connCacheTime;
    @Value("${data_source.connect.cache.size:100}")
    private Integer connCacheSize;

    private enum AuthFileType{
        /*kerberos file*/
        KB,
        /*keyfile*/
        KEY;
        static final Map<String, String> TYPE_URI = new HashMap<>();
        static{
            TYPE_URI.put(AuthType.KERBERS, StringUtils.lowerCase(KB.name()));
            TYPE_URI.put(AuthType.KEYFILE, StringUtils.lowerCase(KEY.name()));
        }
    }

}
