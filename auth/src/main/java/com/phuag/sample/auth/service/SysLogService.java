package com.phuag.sample.auth.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.phuag.sample.auth.dao.SysLogMapper;
import com.phuag.sample.auth.domain.SysLog;
import com.phuag.sample.auth.model.LogDateDetail;
import com.phuag.sample.auth.util.UserUtil;
import com.phuag.sample.common.persistence.service.CrudService;
import com.phuag.sample.auth.vo.LogDateVO;
import com.phuag.sample.common.util.DTOUtil;
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
public class SysLogService extends CrudService<SysLogMapper,SysLog> {
    public Page<SysLog> searchSysLog(String keyword, Pageable pageable) {
        log.debug("search staffs by keyword@" + keyword + ", page @" + pageable);
        Page<SysLog> page = new Page(pageable.getPageNumber(),pageable.getPageSize());
        //TODO need to add sort function ,but the pagerhelper is not support well.
        Page<SysLog> sysLogs;
        if (StringUtils.isNotBlank(keyword)) {
            sysLogs = dao.selectPage(page,null);
        } else {
            sysLogs = dao.selectPage(page,null);
        }
        return sysLogs;
    }

    public Page<LogDateDetail> findPage(Pageable pageable, String p1, String p2, int sort) throws ParseException {
        LogDateVO logDateVO = new LogDateVO();
        logDateVO.setBeginTime(p1);
        logDateVO.setFinishTime(p2);
        logDateVO.setSort(sort);
        Page<SysLog> page = new Page(pageable.getPageNumber(),pageable.getPageSize());
        Page<SysLog> SysLogs = (Page<SysLog>) dao.getAllLog(page,logDateVO);
        Page<LogDateDetail> LogTryOutDetails = DTOUtil.mapPage(SysLogs, LogDateDetail.class);
        return LogTryOutDetails;
    }

    @Override
    public String getOprId() {
        return UserUtil.getUser().getId();
    }
}
