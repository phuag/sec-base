package com.phuag.sample.admin.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.phuag.sample.admin.api.entity.SysLog;
import com.phuag.sample.admin.dao.SysLogMapper;
import com.phuag.sample.admin.api.model.LogDateDetail;
import com.phuag.sample.admin.api.vo.LogDateVO;
import com.phuag.sample.common.core.persistence.service.CrudService;
import com.phuag.sample.common.core.util.DTOUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;

/**
 * Created by vvvvvv on 2017/12/4.
 */
@Service
@Transactional
@Slf4j
public class SysLogService extends CrudService<SysLogMapper, SysLog> {
    public Page<SysLog> searchSysLog(String keyword, Pageable pageable) {
        log.debug("search staffs by keyword@" + keyword + ", page @" + pageable);
        Page<SysLog> page = new Page(pageable.getPageNumber(),pageable.getPageSize());
        //TODO need to add sort function ,but the pagerhelper is not support well.
        Page<SysLog> sysLogs;
        if (StringUtils.isNotBlank(keyword)) {
            sysLogs = baseMapper.selectPage(page,null);
        } else {
            sysLogs = baseMapper.selectPage(page,null);
        }
        return sysLogs;
    }

    public Page<LogDateDetail> findPage(Pageable pageable, String p1, String p2, int sort) throws ParseException {
        LogDateVO logDateVO = new LogDateVO();
        logDateVO.setBeginTime(p1);
        logDateVO.setFinishTime(p2);
        logDateVO.setSort(sort);
        Page<SysLog> page = new Page(pageable.getPageNumber(),pageable.getPageSize());
        Page<SysLog> SysLogs = (Page<SysLog>) baseMapper.getAllLog(page,logDateVO);
        Page<LogDateDetail> LogTryOutDetails = DTOUtil.mapPage(SysLogs, LogDateDetail.class);
        return LogTryOutDetails;
    }

}
