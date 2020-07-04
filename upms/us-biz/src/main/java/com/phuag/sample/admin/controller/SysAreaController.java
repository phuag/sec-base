package com.phuag.sample.admin.controller;

import com.phuag.sample.admin.api.entity.SysArea;
import com.phuag.sample.admin.service.SysAreaService;
import com.phuag.sample.common.core.constant.Constants;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 *
 * @author vvvvvv
 * @date 2018/7/30
 */
@RestController
@RequestMapping(value = Constants.URI_API + Constants.URI_SYS_AREA)
@Slf4j
public class SysAreaController {
    @Resource
    private SysAreaService sysAreaService;
    @GetMapping("/list")
    @ResponseBody
    public ResponseEntity<List<SysArea>> getAreaAll() {
        List<SysArea> sysArea = sysAreaService.list();
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
