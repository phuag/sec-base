package com.phuag.sample.admin.controller;

import com.phuag.sample.common.core.constant.Constants;
import com.phuag.sample.common.core.model.ResponseMessage;
import com.phuag.sample.common.log.annotation.AccessLogger;
import com.phuag.sample.common.log.enums.SysLogType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author vvvvvv
 */
@RestController
@RequestMapping(value = Constants.URI_API)
public class PingController {
   
    /**
     * check if the network connecting is ok.
     * @return 
     */
    @GetMapping("/ping")
    @AccessLogger(module = "测试日志模块",describe = "测试日志访问",type = SysLogType.ACCESS,ignore = false)
    public ResponseEntity<ResponseMessage> ping() {
        return ResponseEntity.ok(ResponseMessage.info("connected"));
    }

}
