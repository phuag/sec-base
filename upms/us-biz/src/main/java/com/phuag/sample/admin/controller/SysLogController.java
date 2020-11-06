package com.phuag.sample.admin.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.phuag.sample.admin.api.entity.SysLog;
import com.phuag.sample.admin.api.model.LogDateDetail;
import com.phuag.sample.admin.service.SysLogService;
import com.phuag.sample.common.core.constant.Constants;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.text.ParseException;

/**
 *
 * @author phuag
 * @date 2017/12/4
 */
@RestController
@RequestMapping(Constants.URI_API + Constants.URI_SYS_LOG)
@Slf4j
public class SysLogController {

    @Resource
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
        Page<LogDateDetail> sysLogs = sysLogService.findPage(page,beginTime,finishTime,sort);
        return ResponseEntity.ok(sysLogs);
    }

    @PostMapping
    public ResponseEntity<Boolean> saveLog(@Valid @RequestBody SysLog sysLog){
        return ResponseEntity.ok(sysLogService.save(sysLog));
    }

}
