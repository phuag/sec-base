package com.phuag.ds.datasource.controller;

import com.phuag.ds.datasource.checks.AbstractDataSourceConnCheck;
import com.phuag.ds.datasource.checks.DataSourceConnCheck;
import com.phuag.ds.datasource.dao.DataSourceMapper;
import com.phuag.ds.datasource.entity.DataSource;
import com.phuag.ds.datasource.service.DataSourceService;
import com.phuag.sample.common.core.model.ResponseMessage;
import com.phuag.sample.common.core.persistence.controller.BaseController;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;

import static org.springframework.http.ResponseEntity.ok;
/**
 * @author phuag
 */
@RestController
@RequestMapping("/api/v1/dataSource")
public class DataSourceController extends BaseController<DataSourceService, DataSourceMapper,DataSource> {

    @PostMapping("/connect/check/{type:\\w+}")
    public ResponseEntity<Object> connectionCheck(@PathVariable("type") String type,
                                                  @RequestParam(value = "authFile", required = false) MultipartFile authFile,
                                                  @Validated DataSource dataSource,
                                                  HttpServletResponse resp){
        DataSourceConnCheck connCheck = AbstractDataSourceConnCheck.getConnCheck(type, resp);
        if (null == connCheck) {
            return ok(ResponseMessage.error("exchange.data_source.check.not.exists"));
        }
        return null;
    }

}
