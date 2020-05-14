package com.phuag.sample.file.controller;

import com.phuag.sample.common.config.Constants;
import com.phuag.sample.common.model.ResponseMessage;
import com.phuag.sample.common.util.IdGen;
import com.phuag.sample.common.util.JSONUtils;
import com.phuag.sample.file.domain.VirtualAddress;
import com.phuag.sample.file.model.CreateVirtualAddressForm;
import com.phuag.sample.file.service.VirtualaddressService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StopWatch;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.regex.Pattern;

/**
 * 文件夹及文件操作
 *
 * @author phuag
 */
@RestController
@RequestMapping(value = Constants.URI_API + Constants.URI_SEC_FILE)
@Slf4j
public class VirtualAddressController {
    @Autowired
    private VirtualaddressService virtualaddressService;

    @PutMapping("renameFileOrDir")
    public ResponseEntity<ResponseMessage> renameFileOrDir(String uid, String newName,
                                                           String vid, String flag) {
        log.info("文件或文件夹重命名数据处理开始,request:{}", 0);

        VirtualAddress virtualAddress = virtualaddressService.getVirtualAddress(vid);
        String suffix = "";
        if (virtualAddress.getAddrType() != 0) {
            suffix = virtualAddress.getFileName().substring(virtualAddress.getFileName().lastIndexOf("."));
        }
        int count = virtualaddressService.checkVirtualAddress(virtualAddress.getUserId(), virtualAddress.getParentPath(), virtualAddress.getAddrType(), virtualAddress.getAddrType() != 0 ? newName + suffix : newName);
        if (count == 0 || flag != null) {
            if (virtualAddress.getAddrType() != 0) {
                if (count > 0) {
                    virtualAddress.setFileName(newName + "(" + count + ")" + virtualAddress.getFileName().substring(virtualAddress.getFileName().lastIndexOf(".")));
                } else {
                    virtualAddress.setFileName(newName + virtualAddress.getFileName().substring(virtualAddress.getFileName().lastIndexOf(".")));
                }
                virtualAddress.setUpdateDate(new Date());
                virtualaddressService.updateVirtualAddress(virtualAddress);
            } else {
                String oldName = virtualAddress.getFileName();
                if (count > 0) {
                    virtualAddress.setFileName(newName + "(" + count + ")");
                } else {
                    virtualAddress.setFileName(newName);
                }
                virtualAddress.setUpdateDate(new Date());
                virtualaddressService.updateVirtualAddress(virtualAddress);

                List<VirtualAddress> virtualAddressDOList = virtualaddressService.listVirtualAddressLikeFilePath(virtualAddress.getUserId(), virtualAddress.getParentPath().equals("/") ? virtualAddress.getParentPath() + oldName : virtualAddress.getParentPath() + "/" + oldName);
                if (virtualAddressDOList != null && virtualAddressDOList.size() > 0) {
                    for (VirtualAddress virtualAddressLike : virtualAddressDOList) {
                        String suff;
                        String pre;
                        if (virtualAddressLike.getParentPath().equals("/")) {
                            suff = virtualAddressLike.getParentPath().substring((virtualAddress.getParentPath() + oldName).length());
                        } else {
                            suff = virtualAddressLike.getParentPath().substring((virtualAddress.getParentPath() + "/" + oldName).length());
                        }
                        if (virtualAddressLike.getParentPath().equals("/")) {
                            pre = virtualAddressLike.getParentPath() + virtualAddress.getFileName();
                        } else {
                            pre = virtualAddressLike.getParentPath() + "/" + virtualAddress.getFileName();
                        }
                        virtualAddressLike.setParentPath(pre + suff);
                        virtualaddressService.updateVirtualAddress(virtualAddressLike);
                    }
                }
            }
            return ResponseEntity.ok(ResponseMessage.success("成功"));
        } else {
            return ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE).body(ResponseMessage.success("重名"));
        }
    }


    /**
     * 删除文件
     */
    @RequestMapping(value = "deleteFile", method = RequestMethod.DELETE)
    public ResponseEntity<ResponseMessage> deleteFile(String uid, String vids) throws Exception {
        log.info("删除文件数据处理开始,vids:{}", vids);
        List<String> vidList = JSONUtils.parseObject(vids, List.class);
        if (vidList != null && vidList.size() > 0) {
            for (String vid : vidList) {
                VirtualAddress va = virtualaddressService.getVirtualAddress(vid);
                if (va.getAddrType() != 0) {
                    virtualaddressService.removeVirtualAddress(va.getUuid());
                    ;
                } else {
                    virtualaddressService.removeVirtualAddress(va.getUuid());
                    List<VirtualAddress> virtualAddressDOList = virtualaddressService.listVirtualAddressLikeFilePath(va.getUserId(), va.getParentPath().equals("/") ? va.getParentPath() + va.getFileName() : va.getParentPath() + "/" + va.getFileName());
                    if (virtualAddressDOList != null && virtualAddressDOList.size() > 0) {
                        for (VirtualAddress item : virtualAddressDOList) {
                            virtualaddressService.removeVirtualAddress(item.getUuid());
                        }
                    }
                }
            }
        }
        log.info("删除文件数据处理结束,result:{}", 0);
        return ResponseEntity.ok(ResponseMessage.success("成功"));
    }

    /**
     * 创建文件夹
     */
    @PostMapping("createDir")
    public ResponseEntity<VirtualAddress> createDir(String dirName, String uid, String parentPath) {
        log.info("创建文件夹数据处理开始,request:{}", 0);
        if (!Pattern.compile("^[a-zA-Z0-9\u4E00-\u9FA5_]+$").matcher(dirName).matches()) {
//            panResult.error("文件夹长度必须小于20，并且不能包含特殊字符，只能为数字、字母、中文、下划线");
            return null;
        }
        int count = virtualaddressService.checkVirtualAddress(uid, parentPath, null, dirName);
        VirtualAddress virtualAddressDO = new VirtualAddress();
        virtualAddressDO.setAddrType(0);
        virtualAddressDO.setDirWhether(1);
        virtualAddressDO.setCreateDate(new Date());
        virtualAddressDO.setFileId(null);
        if (count > 0) {
            virtualAddressDO.setFileName(dirName + "(" + count + ")");
        } else {
            virtualAddressDO.setFileName(dirName);
        }
        virtualAddressDO.setFileSize(0);
        virtualAddressDO.setFileMd5(null);
        virtualAddressDO.setParentPath(parentPath);
        virtualAddressDO.setUserId(uid);
        virtualAddressDO.setUpdateDate(new Date());
        virtualAddressDO.setUuid(IdGen.uuid());
        virtualaddressService.save(virtualAddressDO);
        log.info("创建文件夹数据处理结束,result:{}", virtualAddressDO);
        return ResponseEntity.ok(virtualAddressDO);
    }

    /**
     * 文件复制或移动
     */
    @PutMapping("copyOrMoveFile")
    public ResponseEntity<ResponseMessage> copyOrMoveFile(String uid, String vids, String dest, String opera) {
        log.info("文件复制或移动数据处理开始,request:{}", 0);
        List<String> vidList = JSONUtils.parseObject(vids, List.class);
        for (String vid : vidList) {
            VirtualAddress virtualAddressDO = virtualaddressService.getVirtualAddress(vid);
            if (virtualAddressDO.getAddrType() != 0) {
                if ((dest.equals(virtualAddressDO.getParentPath()) || dest.indexOf((virtualAddressDO.getParentPath().equals("/") ? virtualAddressDO.getParentPath() : virtualAddressDO.getParentPath() + "/") + virtualAddressDO.getFileName()) == 0)) {
                    if (opera.equals("copyOK")) {
                        return ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE).body(ResponseMessage.error("不能将文件复制到自身或其子文件夹中"));
                    } else {
                        return ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE).body(ResponseMessage.error("不能将文件移动到自身或其子文件夹中"));
                    }
                }
                copyOrMoveFile(virtualAddressDO, dest, opera);
            } else {
                if ((dest.equals(virtualAddressDO.getParentPath()) || dest.indexOf((virtualAddressDO.getParentPath().equals("/") ? virtualAddressDO.getParentPath() : virtualAddressDO.getParentPath() + "/") + virtualAddressDO.getFileName()) == 0)) {
                    if (opera.equals("copyOK")) {
                        return ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE).body(ResponseMessage.error("不能将文件复制到自身或其子文件夹中"));
                    } else {
                        return ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE).body(ResponseMessage.error("不能将文件移动到自身或其子文件夹中"));
                    }
                }
                copyOrMoveDirFile(virtualAddressDO, dest, opera);
            }

        }
        log.info("文件复制或移动数据处理结束,result:{}", "成功");

        return ResponseEntity.ok(ResponseMessage.success("成功"));
    }

    /**
     * 复制或移动文件
     */
    private boolean copyOrMoveFile(VirtualAddress virtualAddressDO, String dest, String opera) {
        String oldUuid = virtualAddressDO.getUuid();
        String pre = virtualAddressDO.getFileName().substring(0, virtualAddressDO.getFileName().lastIndexOf("."));
        String suffix = virtualAddressDO.getFileName().substring(virtualAddressDO.getFileName().lastIndexOf("."));
        int count = virtualaddressService.checkVirtualAddress(virtualAddressDO.getUserId(), dest, null, virtualAddressDO.getFileName());
        if (count > 0) {
            virtualAddressDO.setFileName(pre + "(" + count + ")" + suffix);
        }
        virtualAddressDO.setUuid(IdGen.uuid());
        virtualAddressDO.setParentPath(dest);
        virtualAddressDO.setCreateDate(new Date());
        virtualAddressDO.setUpdateDate(new Date());
        if (opera.equals("copyOK")) {
            virtualaddressService.save(virtualAddressDO);
        } else {
            virtualaddressService.removeVirtualAddress(oldUuid);
            virtualaddressService.updateVirtualAddress(virtualAddressDO);
        }
        return true;
    }

    /**
     * 复制或移动文件夹
     */
    private boolean copyOrMoveDirFile(VirtualAddress virtualAddressDO, String dest, String opera) {
        Integer count = virtualaddressService.checkVirtualAddress(virtualAddressDO.getUserId(), dest, null, virtualAddressDO.getFileName());
        String uuid = IdGen.uuid();
        if (opera.equals("moveOK")) {
            virtualaddressService.removeVirtualAddress(virtualAddressDO.getUuid());
        }
        VirtualAddress virtualAddressDONew = new VirtualAddress();
        virtualAddressDONew.setAddrType(0);
        virtualAddressDONew.setCreateDate(new Date());
        virtualAddressDONew.setFileId(null);
        if (count > 0) {
            virtualAddressDONew.setFileName(virtualAddressDO.getFileName() + "(" + count + ")");
        } else {
            virtualAddressDONew.setFileName(virtualAddressDO.getFileName());
        }
        virtualAddressDONew.setFileSize(0);
        virtualAddressDONew.setFileMd5(null);
        virtualAddressDONew.setParentPath(dest);
        virtualAddressDONew.setUserId(virtualAddressDO.getUserId());
        virtualAddressDONew.setUpdateDate(new Date());
        virtualAddressDONew.setUuid(uuid);
        virtualAddressDONew.setDirWhether(1);


        List<VirtualAddress> virtualAddressDOList = virtualaddressService.listVirtualAddressLikeFilePath(virtualAddressDO.getUserId(), virtualAddressDO.getParentPath().equals("/") ? virtualAddressDO.getParentPath() + virtualAddressDO.getFileName() : virtualAddressDO.getParentPath() + "/" + virtualAddressDO.getFileName());
        if (virtualAddressDOList != null && virtualAddressDOList.size() > 0) {
            for (VirtualAddress virtualAddressLike : virtualAddressDOList) {
                String oldUuid = virtualAddressLike.getUuid();
                virtualAddressLike.setUuid(IdGen.uuid());
                virtualAddressLike.setParentPath((dest.equals("/") ? dest : dest + "/") + virtualAddressDONew.getFileName() + virtualAddressDONew.getParentPath().substring(((virtualAddressDO.getParentPath().equals("/") ? virtualAddressDO.getParentPath() : virtualAddressDO.getParentPath() + "/") + virtualAddressDO.getFileName()).length(), virtualAddressLike.getParentPath().length()));
                virtualAddressLike.setCreateDate(new Date());
                virtualAddressLike.setUpdateDate(new Date());
                if (opera.equals("moveOK")) {
                    virtualaddressService.removeVirtualAddress(oldUuid);
                    virtualaddressService.save(virtualAddressLike);
                } else {

                    virtualaddressService.save(virtualAddressLike);
                }
            }
        }
        virtualaddressService.save(virtualAddressDONew);
        return true;

    }

    /**
     * 创建文件(调用)
     */
    @PostMapping("createVirtualAddress")
    public ResponseEntity<ResponseMessage> createVirtualAddress(@RequestBody CreateVirtualAddressForm request) {
        log.info("创建文件数据处理开始,request:{}", request);
        String pre = request.getFileName().substring(0, request.getFileName().lastIndexOf("."));
        String suffix = request.getFileName().substring(request.getFileName().lastIndexOf("."));
        Integer count = virtualaddressService.checkVirtualAddress(request.getUid(), request.getParentPath(), null, request.getFileName());
        VirtualAddress virtualAddressDO = new VirtualAddress();
        if (count > 0) {
            virtualAddressDO.setFileName(pre + "(" + count + ")" + suffix);
        } else {
            virtualAddressDO.setFileName(request.getFileName());
        }
        virtualAddressDO.setUuid(IdGen.uuid());
        virtualAddressDO.setFileId(request.getFid());
        virtualAddressDO.setUserId(request.getUid());
        virtualAddressDO.setFileMd5(request.getMd5());
        virtualAddressDO.setAddrType(request.getMd5() == null ? 0 : Integer.valueOf(request.getFileType()));
        virtualAddressDO.setDirWhether(request.getMd5() == null ? 1 : 0);
        virtualAddressDO.setFileSize(request.getMd5() == null ? 0 : Integer.valueOf(request.getFileSizem()));
        virtualAddressDO.setParentPath(request.getParentPath() == null ? "/" : request.getParentPath());
        virtualAddressDO.setCreateDate(new Date());
        virtualAddressDO.setUpdateDate(new Date());
        int result = virtualaddressService.save(virtualAddressDO);
        log.info("创建文件数据处理结束,result:{}", result);
        return ResponseEntity.ok(ResponseMessage.success("成功"));
    }



}
