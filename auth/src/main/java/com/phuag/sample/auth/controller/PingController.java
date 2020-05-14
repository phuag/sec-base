package com.phuag.sample.modules.sys.controller;

import com.phuag.sample.common.config.Constants;
import com.phuag.sample.common.logging.AccessLogger;
import com.phuag.sample.common.logging.enums.SysLogType;
import com.phuag.sample.common.model.ResponseMessage;
import org.springframework.http.HttpStatus;
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
        return new ResponseEntity<ResponseMessage>(ResponseMessage.info("connected"), HttpStatus.OK);
    }

}
