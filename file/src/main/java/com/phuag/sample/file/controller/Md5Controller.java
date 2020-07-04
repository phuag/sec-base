package com.phuag.sample.file.controller;

import com.phuag.sample.common.core.constant.CacheConstants;
import com.phuag.sample.common.core.constant.Constants;
import com.phuag.sample.file.service.SecFileService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;


/**
 * Md5服务
 *
 * @author: quhailong
 * @date: 2019/9/25
 */
@RestController
@RequestMapping(value = Constants.URI_API + Constants.URI_MD5_CHECK)
@Slf4j
@RequiredArgsConstructor
public class Md5Controller {
    private SecFileService secFileService;
//    @Autowired
//    private JedisClusterUtil jedisClusterUtil;
    private final CacheManager cacheManager;

    /**
     * Md5校验服务
     *
     */
    @GetMapping("md5check")
    public ResponseEntity<Boolean> md5Check(String fid, String md5) {
        log.debug("Md5校验服务数据处理开始,md5:{}", md5);
        Cache cache = cacheManager.getCache(CacheConstants.File_DETAILS);
        boolean result;
//        jedisClusterUtil.setValue("fileMd5:" + fid, md5, 259200);
        cache.put("fileMd5:" + fid, md5);
        int count = secFileService.checkMd5Whether(md5);
        if (count > 0) {
            result = true;
        } else {
            result = false;
        }
        log.debug("Md5校验服务数据处理结束,result:{}", result);
        return ResponseEntity.ok(result);
    }

}
