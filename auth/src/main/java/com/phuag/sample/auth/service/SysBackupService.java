package com.phuag.sample.auth.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.phuag.sample.auth.configuration.SysBackupProperties;
import com.phuag.sample.auth.dao.SysBackupMapper;
import com.phuag.sample.auth.domain.SysBackup;
import com.phuag.sample.auth.model.SysBackupDetail;
import com.phuag.sample.auth.util.BackupUtil;
import com.phuag.sample.auth.util.UserUtil;
import com.phuag.sample.common.persistence.service.CrudService;
import com.phuag.sample.common.enums.ResultEnum;
import com.phuag.sample.common.exception.InnerException;
import com.phuag.sample.common.util.DTOUtil;
import lombok.Cleanup;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.jdbc.DataSourceProperties;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.*;

/**
 * @author lihuadong
 * @date 2018/11/13.
 */
@Service
@Transactional(rollbackFor = Exception.class)
@Slf4j
public class SysBackupService extends CrudService<SysBackupMapper, SysBackup> {

//    @Autowired
//    DruidProperties druidProperties;

    @Autowired
    private DataSourceProperties basicProperties;

    @Autowired
    SysBackupProperties backupProperties;
    /**
     * 数据库安装路径，备份数据库必须在同一服务器上安装数据库
     */
    public  static final  String CANNOT_RUN_PROGRAM = "Cannot run program";

    public Page<SysBackupDetail> getList(String keyword, Pageable pageable){
        Page page = new Page(pageable.getPageNumber(),pageable.getPageSize());

        Page<SysBackup> list = (Page<SysBackup>) dao.queryList(page,keyword);
        Page<SysBackupDetail> details = DTOUtil.mapPage(list,SysBackupDetail.class);
        return details;
    }

    /**
     * @throws Exception
     */
    public SysBackup backupMysql(SysBackup sysBackup){
        String folderPath = BackupUtil.getFolderPath();
        String fileName = BackupUtil.getFileName(sysBackup.getFileName());
        String fullPath = folderPath+fileName;
        File file = new File(fullPath);
        try {
            if (!file.exists()){
                file.createNewFile();
            }
            StringBuffer cmdBuffer = new StringBuffer();
            cmdBuffer.append(backupProperties.getDbInstallPath()+"mysqldump ")
                      .append("-h"+backupProperties.getDbIp())
                      .append(" -u")
                      .append(basicProperties.getUsername())
                      .append(" -p"+basicProperties.getPassword())
                      .append(" "+backupProperties.getDbName());
            Runtime runtime = Runtime.getRuntime();
            // 调用mysql的cmd
            log.info("数据备份命令：" + cmdBuffer.toString());
            Process child = runtime.exec(cmdBuffer.toString());
            @Cleanup InputStream in = child.getInputStream();
            @Cleanup InputStreamReader isr = new InputStreamReader(in,"utf8");
            String inStr;
            StringBuffer sb = new StringBuffer();
            String outStr = "";
            @Cleanup BufferedReader br = new BufferedReader(isr);
            while ((inStr = br.readLine()) != null){
                sb.append(inStr + "\r\n");
            }
            outStr = sb.toString();
            @Cleanup FileOutputStream fos = new FileOutputStream(fullPath);
            @Cleanup OutputStreamWriter writer = new OutputStreamWriter(fos,"utf8");
            writer.write(outStr);
            writer.flush();
            log.info("文件大小："+ file.length()/1024);
            String conver = "KB";
            long fileLength = file.length();
            long num = fileLength/1024;
            if (num> 1024){
                conver = "M";
                num = num/1024;
            }
            String fileSize = num+conver;
            sysBackup.setFileSize(fileSize);
            sysBackup.setFileName(fileName);
            return sysBackup;
        } catch (IOException e) {
            e.printStackTrace();
            if (e.getMessage().contains(CANNOT_RUN_PROGRAM)) {
                throw new InnerException(ResultEnum.DATABASE_PATH_ERROR);
            }
            throw new InnerException(ResultEnum.DATABASE_BACKUP_ERROR);
        }
    }

    public void recoverMysql(SysBackup sysBackup) {
        try {
            // 文件路径
            String filePath = BackupUtil.getFolderPath()+sysBackup.getFileName();
            Runtime runtime = Runtime.getRuntime();
            StringBuffer cmdBuffer = new StringBuffer();
            cmdBuffer.append(backupProperties.getDbInstallPath()+"mysql ")
                     .append("-h"+backupProperties.getDbIp())
                     .append(" -u")
                     .append(basicProperties.getUsername())
                     .append(" -p"+basicProperties.getPassword())
                     .append(" "+backupProperties.getDbName());
            Process child = runtime.exec(cmdBuffer.toString());
            @Cleanup OutputStream out = child.getOutputStream();
            String inStr;
            StringBuffer sb = new StringBuffer();
            @Cleanup BufferedReader br = new BufferedReader(
                    new InputStreamReader(new FileInputStream(filePath),"utf8"));
            while ((inStr = br.readLine()) != null){
                sb.append(inStr + "\r\n");
            }
            String outStr = sb.toString();
            @Cleanup OutputStreamWriter writer = new OutputStreamWriter(out,"utf8");
            writer.write(outStr);
            writer.flush();
        } catch (IOException e) {
            e.printStackTrace();
            if (e.getMessage().contains(CANNOT_RUN_PROGRAM)) {
                throw new InnerException(ResultEnum.DATABASE_PATH_ERROR);
            }
            throw new InnerException(ResultEnum.DATABASE_RECOVER_ERROR);
        }
    }

    /**
     * 删除备份文件
     * @param id
     */
    public void deleteBackupFile(String id){

    }

    @Override
    public String getOprId() {
        return UserUtil.getUser().getId();
    }
}
