package com.phuag.sample.common.core.persistence.controller;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.phuag.sample.common.core.model.ResponseMessage;
import com.phuag.sample.common.core.persistence.domain.DataEntity;
import com.phuag.sample.common.core.persistence.service.CrudService;
import com.phuag.sample.common.core.util.DTOUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

import static org.springframework.http.ResponseEntity.ok;

/**
 * @author phuag
 */
@Slf4j
public abstract class BaseController<S extends CrudService<M,D>,M extends BaseMapper<D>, D extends DataEntity<D>> {
    @Resource
    private S baseService;

    @GetMapping
    public ResponseEntity<Page<D>> selectAll(
            @PageableDefault(page = 0, size = 20, sort = "id", direction = Sort.Direction.DESC) Pageable page) {
        log.debug("get all data of page@{}", page);
        Page<D> data = baseService.findPage(page, Wrappers.emptyWrapper());
        log.debug("get all data, num:{},total:{}", data.getSize(), data.getTotal());
        return ok(data);
    }


    @GetMapping("{id}")
    public ResponseEntity<D> show(@PathVariable String id){
        log.debug("request data by id@{}",id);
        D data = baseService.getById(id);
        log.debug("get data success:{}",data);
        return ok(data);
    }

    @PostMapping
    public ResponseEntity<ResponseMessage> insert(@RequestBody D from) {
        log.debug("save data @{}", from);
        boolean res = baseService.save(from);
        log.debug("saved res is @{}", res);
        return ok(ResponseMessage.info("insert success,res=" + res));
    }

    @PutMapping("/{id}")
    public ResponseEntity<ResponseMessage> update(@PathVariable("id") String id, @RequestBody D form) {
        log.debug("update data id@{},data@{}", id, form);
        D data = baseService.getById(id);
        DTOUtils.mapTo(form, data);
        boolean res = baseService.updateById(data);
        log.debug("updated res is @{}", res);
        return ok(ResponseMessage.info("update data success,res=" + res));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<ResponseMessage> delete(@PathVariable("id") String id) {
        log.debug("delete data by id@{}", id);
        boolean res = baseService.removeById(id);
        log.debug("deleted res is @{}", res);
        return ok(ResponseMessage.info("delete staff success:" + res));
    }

    @DeleteMapping("/batchRemove/{ids}")
    public ResponseEntity<ResponseMessage> batchRemove(@PathVariable String[] ids) {
        boolean result = false;
        for (String id : ids) {
            result = baseService.removeById(id);
        }
        return result ? ok(ResponseMessage.info("batchremove data success"))
                : ok(ResponseMessage.error("batchremove data failed"));
    }
}
