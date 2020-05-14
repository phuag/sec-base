package com.phuag.sample.file.controller;

import com.phuag.sample.common.config.Constants;
import com.phuag.sample.common.util.JedisClusterUtil;
import com.phuag.sample.file.service.SecFileService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


/**
 * Md5服务
 *
 * @author: quhailong
 * @date: 2019/9/25
 */
@RestController
@RequestMapping(value = Constants.URI_API + Constants.URI_MD5_CHECK)
@Slf4j
public class Md5Controller {
    @Autowired
    private SecFileService secFileService;
    @Autowired
    private JedisClusterUtil jedisClusterUtil;

    /**
     * Md5校验服务
     *
     */
    @GetMapping("md5check")
    public ResponseEntity<Boolean> md5Check(String fid, String md5) {
        log.debug("Md5校验服务数据处理开始,md5:{}", md5);
        ResponseEntity<Boolean> result;
        jedisClusterUtil.setValue("fileMd5:" + fid, md5, 259200);
        int count = secFileService.checkMd5Whether(md5);
        if (count > 0) {
            result = ResponseEntity.ok(true);
        } else {
            result = ResponseEntity.ok(false);
        }
        log.debug("Md5校验服务数据处理结束,result:{}", result);
        return result;
    }

}
