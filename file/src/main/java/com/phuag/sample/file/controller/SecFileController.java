package com.phuag.sample.file.controller;

import com.phuag.sample.common.config.Constants;
import com.phuag.sample.common.model.FolderInfo;
import com.phuag.sample.common.model.ResponseMessage;
import com.phuag.sample.common.util.DTOUtil;
import com.phuag.sample.common.util.JSONUtils;
import com.phuag.sample.common.util.JedisClusterUtil;
import com.phuag.sample.file.domain.SecFile;
import com.phuag.sample.file.domain.VirtualAddress;
import com.phuag.sample.file.model.*;
import com.phuag.sample.file.service.SecFileService;
import com.phuag.sample.file.service.VirtualaddressService;
import com.phuag.sample.file.util.FileUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

/**
 * @author phuag
 */
@RestController
@RequestMapping(value = Constants.URI_API + Constants.URI_SEC_FILE)
@Slf4j
public class SecFileController {

    @Autowired
    private SecFileService secFileService;

    @Autowired
    private VirtualaddressService virtualaddressService;

    @Autowired
    private JedisClusterUtil jedisClusterUtil;

    @GetMapping("/download")
    public ResponseEntity<ResponseMessage> download(String uid, String vids, HttpServletResponse res) throws IOException {
        log.info("下载文件数据处理开始,vids:{}", vids);
        List<String> vidList = JSONUtils.parseObject(vids, List.class);
//        downloadProvider.downloadHandle(uid, vids, res);
        secFileService.download(uid, vidList, res);
        log.info("下载文件数据处理结束");

        return ResponseEntity.ok(ResponseMessage.info("ok"));
    }

    @PostMapping("/uploadFile")
    public ResponseEntity<ResponseMessage> uploadFile(String fid, MultipartFile file, String uid, String parentPath) throws IOException {
        log.info("上传文件数据处理开始,fid:{},file:{},uid:{},parentPath:{}", fid, file, uid, parentPath);
        if (parentPath != null) {
            parentPath = URLDecoder.decode(parentPath, "UTF-8");
        } else {
            parentPath = "/";
        }
        String upPath = "";
        synchronized (this) {
            // 我的资源/滴滴滴.txt
            if (file.getOriginalFilename().contains("/")) {
                upPath = file.getOriginalFilename().substring(0, file.getOriginalFilename().lastIndexOf("/"));
                if ("/".contains(upPath)) {
                    upPath = upPath.substring(upPath.lastIndexOf("/") + 1);
                }
                int count = virtualaddressService.checkVirtualAddress(uid, parentPath, null, upPath);
                if (count == 0) {

                    virtualaddressService.createDir(upPath, parentPath, uid);
                }
            }
            String md5 = jedisClusterUtil.getValue("fileMd5:" + fid);
            jedisClusterUtil.delKey("fileMd5:" + fid);
            int count = secFileService.checkMd5Whether(md5);
            SecFile fileDO;
            if (count > 0) {
                fileDO = secFileService.getFileByMd5(md5);
            } else {
                String path = FileUtils.saveFile(file);
                fileDO = secFileService.saveFileToDatabase(file, path, md5);
            }
            VirtualAddress createVirtualAddressRequest = new VirtualAddress();
            createVirtualAddressRequest.setFileId(fileDO.getFileId());
            createVirtualAddressRequest.setFileName(file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("/") + 1));
            createVirtualAddressRequest.setFileSize(fileDO.getFileSize());
            createVirtualAddressRequest.setFileMd5(md5);
            createVirtualAddressRequest.setUuid(uid);
            if (parentPath.equals("/")) {
                createVirtualAddressRequest.setParentPath(parentPath + upPath);
            } else {
                createVirtualAddressRequest.setParentPath(upPath.equals("") ? parentPath : parentPath + "/" + upPath);
            }
            virtualaddressService.save(createVirtualAddressRequest);
        }
        log.info("上传文件数据处理结束,result:{}", 0);
        return ResponseEntity.ok(ResponseMessage.info("ok"));
    }



    /**
     * 查询文件列表
     *
     * @return
     */
    @GetMapping("listFile")
    public ResponseEntity<List<VirtualAddress>> listFile(@RequestParam("userId") String userId,
                                                         @RequestParam("type") String type,
                                                         @RequestParam("path") String path,
                                                         @PageableDefault(page = 1, size = 20, sort = "dir_whether", direction = Sort.Direction.DESC) Pageable page) throws UnsupportedEncodingException {
        log.info("查询文件列表请求,userId：{},type:{},path:{}", userId, type, path);
        Assert.notNull(path, "path cannot be empty");
        path = URLDecoder.decode(path, "UTF-8");
        int fileType = 0;
        String parentPath = null;
        if (type.equals("all")) {
            parentPath = path;
            fileType = 0;
        } else if (type.equals("pic")) {
            fileType = 1;
        } else if (type.equals("doc")) {
            fileType = 2;
        } else if (type.equals("video")) {
            fileType = 3;
        } else if (type.equals("mbt")) {
            fileType = 4;
        } else if (type.equals("music")) {
            fileType = 5;
        } else if (type.equals("other")) {
            fileType = 6;
        } else {
            fileType = 7;
        }
        List<VirtualAddress> virtualAddressList = virtualaddressService.listVirtualAddress(userId, parentPath, fileType);
        log.info("查询文件列表数据处理结束,result:{}", virtualAddressList);
        return ResponseEntity.ok(virtualAddressList);

    }


    /**
     * 展示文件夹列表
     *
     * @return
     */
    @GetMapping(value = "listFolder")
    public ResponseEntity<List<FolderInfo>> listFolder(@RequestParam("userId") String userId,
                                                       @RequestParam("parentPath") String parentPath) throws Exception {
        log.info("展示文件夹列表数据处理开始,request:{},parentPath:{}", userId, parentPath);
        Assert.notNull(parentPath, "parentPath cannot be empty");
        parentPath = URLDecoder.decode(parentPath, "UTF-8");
        List<VirtualAddress> virtualAddressList = virtualaddressService.listVirtualAddress(userId, parentPath, 0);
        List<FolderInfo> folderInfos = new ArrayList<>();
        for (VirtualAddress item : virtualAddressList) {
            String childFold = "/".equals(parentPath) ? parentPath + item.getFileName() : parentPath + "/" + item.getFileName();
            List<VirtualAddress> children = virtualaddressService.listVirtualAddress(userId, childFold, 0);
            FolderInfo folderInfo = new FolderInfo();
            folderInfo.setPath(childFold);
            if (children != null && children.size() > 0) {
                folderInfo.setDir_empty(1);
            } else {
                folderInfo.setDir_empty(0);
            }
            folderInfos.add(folderInfo);
        }
        log.info("展示文件夹列表数据处理结束,result:{}", folderInfos);
        return ResponseEntity.ok(folderInfos);
    }


    /**
     * 搜索文件
     *
     * @return
     */
    @GetMapping("searchFile")
    public ResponseEntity<List<VirtualAddress>> searchFile(@RequestParam(value = "userId", required = false) String userId,
                                                           @RequestParam(value = "q", required = false) String keyword,
                                                           @PageableDefault(page = 1, size = 20, sort = "dir_whether", direction = Sort.Direction.DESC) Pageable page) {
        log.info("搜索文件数据处理开始,userId:{},keyword:{}", userId, keyword);
        List<VirtualAddress> virtualAddress = virtualaddressService.listVirtualAddressLikeFileName(userId, keyword);
        log.info("搜索文件数据处理结束,result:{}", virtualAddress);
        return ResponseEntity.ok(virtualAddress);
    }

    /**
     * 查询文件夹是否存在(调用)
     */
    @GetMapping(value = "checkdirwhether", consumes = "application/json")
    public ResponseEntity<Integer> checkDirWhether(@RequestBody CheckDirWhetherForm request) {
        log.info("查询文件夹是否存在数据处理开始,request:{}", request);
        int count = virtualaddressService.checkVirtualAddress(request.getUid(), request.getParentPath(), null, request.getDirName());
        log.info("查询文件夹是否存在数据处理结束,result:{}", count);
        return ResponseEntity.ok(count);
    }

    /**
     * 根据虚拟地址ID获取文件名称(调用)
     */
    @GetMapping("getFileNameByVid")
    public ResponseEntity<VirtualAddress> getFileNameByVid(String vid) {
        log.info("根据虚拟地址ID获取文件名称数据处理开始,vid:{}", vid);
        //todo frist
        VirtualAddress virtualAddress = virtualaddressService.getVirtualAddress(vid);
        log.info("根据虚拟地址ID获取文件名称数据处理结束,result:{}", virtualAddress);
        return ResponseEntity.ok(virtualAddress);
    }

    /**
     * 根据虚拟地址ID获取实体
     */
    @GetMapping("getVirtualAddress")
    public ResponseEntity<VirtualAddressDTO> getVirtualaddress(String vid, String uid) {
        log.info("根据虚拟地址ID获取实体数据处理开始,vid:{}", vid);
        VirtualAddress va = virtualaddressService.getVirtualAddress(vid);
        VirtualAddressDTO result = DTOUtil.map(va, VirtualAddressDTO.class);
        log.info("根据虚拟地址ID获取实体数据处理结束,result:{}", result);
        return ResponseEntity.ok(result);
    }


}
