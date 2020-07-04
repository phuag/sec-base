package com.phuag.sample.admin.controller;

import com.phuag.sample.admin.api.entity.SysMenu;
import com.phuag.sample.admin.api.model.MenuDetail;
import com.phuag.sample.admin.service.SysMenuService;
import com.phuag.sample.common.core.constant.Constants;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author lihuadong
 * @date 2018/08/14.
 */
@RestController
@RequestMapping(value = Constants.URI_API + Constants.URI_SYS_MENU)
@Slf4j
public class SysMenuController {
    @Resource
    private SysMenuService sysMenuService;

    @GetMapping("/list")
    public ResponseEntity<List<SysMenu>> getSysMenu() {
        List<SysMenu> SysMenus = sysMenuService.list();
        return new ResponseEntity<List<SysMenu>>(SysMenus, HttpStatus.OK);
    }

    /**
     * 获取所有的菜单和按钮
     * @return
     */
    @GetMapping("/getMenuDetail")
    public ResponseEntity<List<MenuDetail>> getMenuDetail() {
        return ResponseEntity.ok(sysMenuService.queryMenu());
    }

}
