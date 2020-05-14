package com.phuag.sample.auth.util;

import org.apache.commons.lang3.StringUtils;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author lihuadong
 * @date 2018/11/13.
 */
public class BackupUtil {
    public static String getFolderPath(){
        // C:\Users\
        String folderPath = System.getProperty("user.home")+ File.separator+".authManage"+File.separator;
        File file = new File(folderPath);
        if (!file.exists()){
            file.mkdir();
        }
        return folderPath;
    }
    public static String getFileName(String fileName){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
        String date = sdf.format(new Date());
        if (StringUtils.isBlank(fileName)){
            fileName = date+".sql";
        }else {
            fileName += ".sql";
        }
        return fileName;
    }
}
