package com.phuag.ds.common.util;

import com.phuag.ds.common.auth.AuthConstraints;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.URL;
import java.net.UnknownHostException;
import java.util.UUID;

/**
 * @author phuag
 */
@Slf4j
public class DsUtils {
    private static final String LOCAL_ADDR = "127.0.0.1";
    private static final String HTTP_HEADER = "http://";
    public static void downloadFile(String source, String dst) {
        FileOutputStream out = null;
        InputStream in = null;
        try {
            out = new FileOutputStream(dst);
            if (source.startsWith(HTTP_HEADER)) {
                String ip;
                try {
                    ip = InetAddress.getLocalHost().getHostAddress();
                } catch (UnknownHostException e) {
                    ip = LOCAL_ADDR;
                }
                if (source.substring(HTTP_HEADER.length()).startsWith(ip)) {
                    source = source.replace(ip, LOCAL_ADDR);
                }
                HttpURLConnection conn = null;
                try {
                    conn = (HttpURLConnection) new URL(source).openConnection();
                    conn.addRequestProperty("Cookie", AuthConstraints.DEFAULT_SSO_COOKIE + "="
                            + System.getProperty(AuthConstraints.ENV_SERV_TOKEN));
                    log.info("Cookie: " + AuthConstraints.DEFAULT_SSO_COOKIE + "="
                            + System.getProperty(AuthConstraints.ENV_SERV_TOKEN));
                    conn.setRequestMethod("GET");
                    conn.setConnectTimeout(2000);
                    conn.setReadTimeout(5000);
                    conn.setDoOutput(true);
                    conn.setDoInput(true);
                    conn.connect();
                    in = conn.getInputStream();
                    IOUtils.copy(in, out);
                } finally {
                    if (null != conn) {
                        conn.disconnect();
                    }
                }
            } else {
                try {
                    in = new FileInputStream(dst);
                    IOUtils.copy(in, out);
                } finally {
                    if (null != in) {
                        in.close();
                    }
                }
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        } finally {
            if (null != out) {
                try {
                    out.close();
                } catch (IOException e) {
                    log.error(e.getMessage());
                }
            }
        }
    }

    public static String newFileName(String originName){
        String newName = UUID.randomUUID().toString().replace("-", "");
        if(StringUtils.isNotBlank(originName)){
            int index = originName.lastIndexOf(".");
            if(index >= 0){
                newName += originName.substring(index);
            }
        }
        return newName;
    }

    /**
     * remove http file
     * @param source
     */
    public static void removeFile(String source){
        HttpURLConnection connection = null;
        try{
            if(source.startsWith(HTTP_HEADER)){
                String ip;
                try {
                    ip = InetAddress.getLocalHost().getHostAddress();
                } catch (UnknownHostException e) {
                    ip = LOCAL_ADDR;
                }
                if(source.substring(HTTP_HEADER.length()).startsWith(ip)) {
                    source = source.replace(ip, LOCAL_ADDR);
                }
                connection = (HttpURLConnection)new URL(source).openConnection();
                connection.addRequestProperty("Cookie",AuthConstraints.DEFAULT_SSO_COOKIE + "="
                        + System.getProperty(AuthConstraints.ENV_SERV_TOKEN));
                connection.setRequestMethod("DELETE");
                connection.setConnectTimeout(2000);
                connection.setReadTimeout(5000);
                connection.setDoOutput(true);
                connection.setDoOutput(true);
                connection.connect();
            }
        }catch(IOException e){
            throw new RuntimeException(e);
        }finally{
            if(null != connection){
                connection.disconnect();
            }
        }
    }
}
