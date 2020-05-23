package com.phuag.sample.file.service;

import com.phuag.sample.common.persistence.service.CrudService;
import com.phuag.sample.common.util.IdGen;
import com.phuag.sample.file.dao.SecFileMapper;
import com.phuag.sample.file.dao.VirtualAddressMapper;
import com.phuag.sample.file.domain.SecFile;
import com.phuag.sample.file.domain.VirtualAddress;
import com.phuag.sample.file.util.FastDFSClient;
import com.phuag.sample.file.util.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;
import java.util.zip.ZipOutputStream;

/**
 * @author phuag
 */
@Service
public class SecFileService extends CrudService<SecFileMapper, SecFile> {
    @Autowired
    private VirtualAddressMapper virtualAddressMapper;

    /**
     * 查询md5是否已经存在
     */
    public int checkMd5Whether(String fileMd5) {
        return dao.checkMd5Whether(fileMd5);
    }

    /**
     * 根据Md5获取文件信息
     */
    public SecFile getFileByMd5(String fileMd5) {
        return dao.getFileByMd5(fileMd5);
    }

    /**
     * 保存文件信息
     */
    public Integer saveFile(SecFile fileDO) {
        return dao.insert(fileDO);
    }

    /**
     * 根据文件ID获取文件信息
     */
    public SecFile getFileByFid(String fileId) {
        return dao.getFileByFid(fileId);
    }

    /**
     * 处理下载
     *
     */
    public void download(String uid, List<String> vidList, HttpServletResponse res) throws IOException {
        String fileName2 = virtualAddressMapper.getVirtualAddress(vidList.get(0)).getFileName();
        Map<String, String> map = getFids(vidList, uid);
        if (map != null && map.size() == 1) {
            for (Map.Entry<String, String> entry : map.entrySet()) {
                String groupName;
                String remoteFileName;
                String fileName = entry.getKey();
                groupName = entry.getValue().substring(0, entry.getValue().indexOf("/"));
                remoteFileName = entry.getValue().substring(groupName.length() + 1);
                InputStream inputStream = FastDFSClient.downFile(groupName, remoteFileName);
//                InputStream is = HDFSUtils.down
                res.setContentType("application/octet-stream");
                res.setHeader("Content-Disposition", "attachment;filename=" + new String(fileName.getBytes(), "ISO-8859-1"));
                byte[] buff = new byte[1024];
                BufferedInputStream bis = null;
                OutputStream os = null;
                try {
                    os = res.getOutputStream();
                    bis = new BufferedInputStream(inputStream);
                    int i = bis.read(buff);
                    while (i != -1) {
                        os.write(buff, 0, buff.length);
                        os.flush();
                        i = bis.read(buff);
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    if (bis != null) {
                        try {
                            bis.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
        } else if (map != null && map.size() > 1) {
            String folderName = UUID.randomUUID().toString().replaceAll("-", "");
            File fileDir = new File(folderName);
            fileDir.mkdir();
            String fileName3 = "【批量下载】" + fileName2.substring(0, fileName2.lastIndexOf(".")) + "等.zip";
            String zipFilePath = folderName + "/" + fileName3;
            File zip = new File(zipFilePath);
            if (!zip.exists()) {
                zip.createNewFile();
            }
            FileOutputStream fos = new FileOutputStream(zip);
            ZipOutputStream zos = new ZipOutputStream(fos);
            for (Map.Entry<String, String> entry : map.entrySet()) {
                String fileName = entry.getKey();
                String groupName = entry.getValue().substring(0, entry.getValue().indexOf("/"));
                String remoteFileName = entry.getValue().substring(groupName.length() + 1, entry.getValue().length());
                InputStream inputStream = FastDFSClient.downFile(groupName, remoteFileName);
                File file = new File(folderName + "/" + fileName);
                OutputStream os = new FileOutputStream(file);
                int bytesRead = 0;
                byte[] buffer = new byte[8192];
                while ((bytesRead = inputStream.read(buffer, 0, 8192)) != -1) {
                    os.write(buffer, 0, bytesRead);
                }
                os.flush();
                os.close();
                inputStream.close();
                FileUtils.zipFile(file, zos);
            }
            zos.closeEntry();
            zos.close();
            fos.close();
            res.setContentType("application/octet-stream");
            res.setHeader("Content-Disposition", "attachment;filename=" + new String(fileName3.getBytes(), "ISO-8859-1"));
            byte[] buff = new byte[1024];
            BufferedInputStream bis = null;
            OutputStream os = null;
            try {
                InputStream fis = new BufferedInputStream(new FileInputStream(zipFilePath));
                os = res.getOutputStream();
                bis = new BufferedInputStream(fis);
                int i = bis.read(buff);
                while (i != -1) {
                    os.write(buff, 0, buff.length);
                    os.flush();
                    i = bis.read(buff);
                }
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                if (bis != null) {
                    try {
                        bis.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
            FileUtils.delFolder(folderName);
        }
    }

    private Map<String, String> getFids(List<String> vidList, String uid) {
        Map<String, String> map = new HashMap<>();
        for (String vid : vidList) {
            VirtualAddress virtualaddressDTO = virtualAddressMapper.getVirtualAddress(vid);
            SecFile fileDO = this.getFileByFid(virtualaddressDTO.getFileId());
            map.put(virtualaddressDTO.getFileName(), fileDO.getFileLocation());
        }
        return map;
    }

    /**
     * 保存文件到数据库
     */
    public SecFile saveFileToDatabase(MultipartFile file, String path, String md5) {
        String fileName = file.getOriginalFilename();
        if (file.getOriginalFilename().contains("/")) {
            fileName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("/") + 1);
        }
        String fid = IdGen.uuid();
        SecFile fileDO = new SecFile();
        fileDO.setFileId(fid);
        fileDO.setOriginalName(fileName);
        fileDO.setFileLocation(path);
        fileDO.setFileSize((int) file.getSize());
        fileDO.setFileMd5(md5);
        fileDO.setCreateDate(new Date());
        String contentType = file.getContentType();
        if (contentType.equals("image/jpeg") || contentType.equals("image/gif")) {
            fileDO.setFileType(1);
        } else if (contentType.equals("application/pdf") || contentType.equals("application/msword") || contentType.equals("application/vnd.openxmlformats-officedocument.wordprocessingml.document") || contentType.equals("application/x-ppt") || contentType.equals("application/vnd.openxmlformats-officedocument.presentationml.presentation") || file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1, file.getOriginalFilename().length()).equals("txt")) {
            fileDO.setFileType(2);
        } else if (contentType.equals("video/mpeg4") || contentType.equals("video/avi") || contentType.equals("application/vnd.rn-realmedia-vbr") || contentType.equals("video/mpg") || contentType.equals("video/x-ms-wmv")) {
            fileDO.setFileType(3);
        } else if (contentType.equals("application/x-bittorrent")) {
            fileDO.setFileType(4);
        } else if (contentType.equals("audio/mp3")) {
            fileDO.setFileType(5);
        } else {
            fileDO.setFileType(6);
        }
        this.saveFile(fileDO);
        return fileDO;
    }
}
