package com.phuag.sample.admin.service;

import com.phuag.sample.admin.api.entity.SysOffice;
import com.phuag.sample.admin.dao.SysOfficeMapper;
import com.phuag.sample.common.core.persistence.service.TreeService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 *
 * @author vvvvvv
 * @date 2017/12/28
 */
@Service
@Slf4j
public class SysOfficeService extends TreeService<SysOfficeMapper, SysOffice> {

    @Transactional(readOnly = true,rollbackFor = Exception.class)
    public List<SysOffice> searchSysOffice(String officeId) {
        log.debug("search office by officeId@{}", officeId);
        List<SysOffice> offices;
        if (StringUtils.isNotBlank(officeId)) {
            offices = baseMapper.selectSubOfficeById(officeId);
        } else {
            offices = baseMapper.selectList(null);
        }
        return offices;
    }

//    @Transactional(readOnly = true,rollbackFor = Exception.class)
//    public String getOfficeNameWithPath(SysOffice office) {
//        StringBuilder officeNameWithPath = new StringBuilder();
//        String parentIds = office.getParentIds();
//        String[] ids = parentIds.split(",");
//        for (String id : ids) {
//            if("0".equals(id)){
//                continue;
//            }
//            String name = dao.selectByPrimaryKey(id).getName();
//            officeNameWithPath.append("-").append(name);
//        }
//        return officeNameWithPath + "-" + office.getName();
//    }
}
