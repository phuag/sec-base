package com.phuag.sample.admin.service;

import com.phuag.sample.admin.api.entity.SysOauthClientDetails;
import com.phuag.sample.admin.dao.SysOauthClientDetailsMapper;
import com.phuag.sample.common.core.constant.CacheConstants;
import com.phuag.sample.common.core.persistence.service.CrudService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author lengleng
 * @since 2019/2/1
 */
@Service
@Slf4j
public class SysOauthClientDetailsService extends CrudService<SysOauthClientDetailsMapper, SysOauthClientDetails> {

    /**
     * 通过ID删除客户端
     *
     * @param id
     * @return
     */
    @CacheEvict(value = CacheConstants.CLIENT_DETAILS_KEY, key = "#id")
    public Boolean removeClientDetailsById(String id) {
        return this.removeById(id);
    }

    /**
     * 根据客户端信息
     *
     * @param clientDetails
     * @return
     */
    @CacheEvict(value = CacheConstants.CLIENT_DETAILS_KEY, key = "#clientDetails.clientId")
    public Boolean updateClientDetailsById(SysOauthClientDetails clientDetails) {
        return this.updateById(clientDetails);
    }
}
