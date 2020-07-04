package com.phuag.sample.admin.controller;

import com.phuag.sample.admin.api.entity.SysOffice;
import com.phuag.sample.admin.service.SysOfficeService;
import com.phuag.sample.common.core.constant.Constants;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by vvvvvv on 2017/12/28.
 */
@RestController
@RequestMapping(value = Constants.URI_API + Constants.URI_SYS_OFFICE)
@Slf4j
public class SysOfficeController {
    @Resource
    private SysOfficeService sysOfficeService;

    @GetMapping
    @ResponseBody
    public ResponseEntity<List<SysOffice>> getAllSysOffice(
            @RequestParam(value = "officeId", required = false) String officeId) {
        log.debug("get all SysUser of officeId@{}", officeId);
        List<SysOffice> sysUsers = sysOfficeService.searchSysOffice(officeId);
        log.debug("get all SysUser, num:{}", sysUsers.size());
        log.debug("get all SysUser, num:{}", sysOfficeService.searchSysOffice(officeId));
        return ResponseEntity.ok(sysUsers);
    }
}
