package com.phuag.sample.auth.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.phuag.sample.auth.domain.SysBackup;
import com.phuag.sample.auth.model.SysBackupDetail;
import com.phuag.sample.auth.service.SysBackupService;
import com.phuag.sample.common.config.Constants;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * @author lihuadong
 * @date 2018/11/13.
 */
@RestController
@RequestMapping(value = Constants.URI_API + Constants.URI_SYS_BACKUP)
@Slf4j
public class SysBackupController  {

    @Autowired
    SysBackupService sysBackupService;

    @GetMapping
    public ResponseEntity<Page<SysBackupDetail>> getList(
            @RequestParam(value = "keyword", required = false) String keyword,
            @PageableDefault(page = 0, size = 20, sort = "createDate",direction = Sort.Direction.DESC) Pageable page) {
           return ResponseEntity.ok(sysBackupService.getList(keyword,page));
    }
    @PostMapping()
    public ResponseEntity backup(@RequestBody SysBackup sysBackup) throws Exception{
        SysBackup  newSysBackup =  sysBackupService.backupMysql(sysBackup);
        newSysBackup.setNewRecord(true);
        sysBackupService.save(newSysBackup);
        return ResponseEntity.ok(Constants.BACKUP_SUCCESS);
    }
    @PostMapping("/{id}")
    public ResponseEntity recover(@PathVariable String id) throws Exception{
        SysBackup sysBackup = sysBackupService.select(id);
        sysBackupService.recoverMysql(sysBackup);
        return ResponseEntity.ok(Constants.RECOVER_SUCCESS);
    }
    @DeleteMapping("/{id}")
    public ResponseEntity delete(@PathVariable String id) {
        sysBackupService.delete(id);
        return ResponseEntity.ok(Constants.DELETE_SUCCESS);
    }
}
