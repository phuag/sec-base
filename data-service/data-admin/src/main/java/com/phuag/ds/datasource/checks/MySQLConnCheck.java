package com.phuag.ds.datasource.checks;

import com.phuag.ds.datasource.Configuration;
import com.phuag.ds.datasource.entity.DataSource;
import com.phuag.ds.datasource.entity.DataSourceModel;
import com.phuag.ds.datasource.service.DataSourceService;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import static com.phuag.ds.common.datasource.Constants.*;
import static com.phuag.ds.datasource.checks.DataSourceConnCheck.PREFIX;

@Service(PREFIX + "mysql")
public class MySQLConnCheck extends AbstractDataSourceConnCheck{
    private static final Logger LOG = LoggerFactory.getLogger(MySQLConnCheck.class);

    private static final String DB_DRIVER = "com.mysql.jdbc.Driver";
    private static final String URL_TEMPLATE = "jdbc:mysql://%s:%d";

    @Resource
    private Configuration conf;
    @Resource
    private DataSourceService dataSourceService;
    @Override
    public void validate(DataSourceModel md) throws Exception {
        Map<String,Object> param = md.resolveParams();
        Set<String> keys = param.keySet();
        if(!keys.contains(PARAM_SFTP_HOST) ||
                StringUtils.isBlank(String.valueOf(param.get(PARAM_SFTP_HOST)))){
            throw new Exception(PARAM_SFTP_HOST + " cannot be null");
        }
        if(!keys.contains(PARAM_SFTP_PORT) ||
                StringUtils.isBlank(String.valueOf(param.get(PARAM_SFTP_PORT)))){
            throw new Exception(PARAM_SFTP_PORT + " cannot be null");
        }
        try{
            Integer.valueOf(String.valueOf(param.get(PARAM_SFTP_PORT)));
        }catch(NumberFormatException e){
            throw new Exception(PARAM_SFTP_PORT + " is not a number");
        }
    }

    @Override
    @SuppressWarnings("unchecked")
    public void check(DataSource ds, File file) throws Exception {
        Map<String,Object> param = ds.resolveParams();
        String host = String.valueOf(param.get(PARAM_SFTP_HOST));
        int port = Integer.parseInt(param.get(PARAM_SFTP_PORT).toString());
        String parameter = "";
        if(param.containsKey(PARAM_KEY_TDSQL_CONFIG)){
            Map<String,Object> param1 = (Map<String, Object>) param.get(PARAM_KEY_TDSQL_CONFIG);
            parameter = param1.entrySet().stream().map(
                    e->String.join("=", e.getKey(), String.valueOf(e.getValue()))
            ).collect(Collectors.joining("&"));
        }

        String url = String.format(URL_TEMPLATE, host, port);
        if(StringUtils.isNotEmpty(parameter)){
            url += "?" + parameter;
        }
        String username = String.valueOf(param.get(PARAM_DEFAULT_USERNAME));
        String password = String.valueOf(param.get(PARAM_DEFAULT_PASSWORD));
        Connection conn = null;
        Statement stmt = null;
        try {
            Class.forName(DB_DRIVER);
            conn = DriverManager.getConnection(url,username,password);
            stmt = conn.createStatement();
        } catch (SQLException e) {
            LOG.error("SQLException:" +e.getMessage(), e);
            throw new Exception(e);
        }finally {
            try {
                if(stmt != null){
                    stmt.close();
                }
                if (conn != null){
                    conn.close();
                }
            }catch (SQLException e){
                LOG.error("SQLException:" +e.getMessage(), e);
            }
        }
    }
}
