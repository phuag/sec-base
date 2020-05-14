package com.phuag.sample.auth.controller;

import com.phuag.sample.auth.domain.SysArea;
import com.phuag.sample.auth.service.SysAreaService;
import com.phuag.sample.common.config.Constants;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by vvvvvv on 2018/7/30.
 */
@RestController
@RequestMapping(value = Constants.URI_API + Constants.URI_SYS_AREA)
@Slf4j
public class SysAreaController {
    @Autowired
    private SysAreaService sysAreaService;
    @GetMapping("/list")
    @ResponseBody
    public ResponseEntity<List<SysArea>> getAreaAll() {
        List<SysArea> sysArea = sysAreaService.selectAll();
        return ResponseEntity.ok(sysArea);
    }
    /**
     * 根据id获取对应的areaid
     */
    @GetMapping("/getareaid")
    @ResponseBody
    public ResponseEntity<List<String>> getAreaId(
            @RequestParam(value = "id", required = false) String id){
        List<String> areaid = sysAreaService.getAreaid(id);
        return  ResponseEntity.ok(areaid);
    }

}
