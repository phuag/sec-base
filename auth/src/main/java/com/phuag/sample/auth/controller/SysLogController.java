package com.phuag.sample.auth.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.phuag.sample.auth.domain.SysLog;
import com.phuag.sample.auth.model.LogDateDetail;
import com.phuag.sample.auth.service.SysLogService;
import com.phuag.sample.common.config.Constants;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;

/**
 * Created by vvvvvv on 2017/12/4.
 */
@RestController
@RequestMapping(value = Constants.URI_API + Constants.URI_SYS_LOG)
@Slf4j
public class SysLogController {

    @Autowired
    private SysLogService sysLogService;

    @GetMapping
    @ResponseBody
    public ResponseEntity<Page<SysLog>> getAllStaff(
            @RequestParam(value = "q", required = false) String keyword,
            @PageableDefault(page = 0, size = 20, sort = "staffId", direction = Sort.Direction.DESC) Pageable pageable) {
        log.debug("get all staffInfo of q@{},page@{}", keyword, pageable);
        Page<SysLog> logs = sysLogService.searchSysLog(keyword, pageable);
        log.debug("get allStaff, num:{}", logs.getSize());
        return ResponseEntity.ok(logs);
    }
    /**
    *   日志页面的后台查询数据
    */
    @GetMapping("/list")
    @ResponseBody
    public ResponseEntity<Page<LogDateDetail>> getAll(
            @PageableDefault(page = 0, size = 10, sort = "logId", direction = Sort.Direction.DESC) Pageable page,
            @RequestParam(value = "finishTime", required = false) String finishTime,
            @RequestParam(value = "beginTime", required = false) String beginTime,
            @RequestParam(value = "sort", required = false) int sort) throws ParseException {
        Page<LogDateDetail> syslogs = sysLogService.findPage(page,beginTime,finishTime,sort);
        return ResponseEntity.ok(syslogs);

    }

}
