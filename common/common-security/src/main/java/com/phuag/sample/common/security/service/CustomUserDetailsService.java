package com.phuag.sample.common.security.service;

import cn.hutool.core.util.ArrayUtil;
import com.phuag.sample.admin.api.feign.RemoteUserService;
import com.phuag.sample.admin.api.model.SysUserDetail;
import com.phuag.sample.common.core.constant.CacheConstants;
import com.phuag.sample.common.core.constant.SecurityConstants;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

/**
 * @author phuag
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {

    private final RemoteUserService remoteUserService;
    private final CacheManager cacheManager;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Cache cache = cacheManager.getCache(CacheConstants.USER_DETAILS);
        if (cache != null && cache.get(username) != null) {
            UserDetails cacheUserDetails =  (UserDetails) cache.get(username).get();
            return cacheUserDetails;
        }

        ResponseEntity<SysUserDetail> result = remoteUserService.info(username, SecurityConstants.FROM_IN);
        UserDetails userDetails = getUserDetails(result);
        cache.put(username, userDetails);
        return userDetails;
    }

    private UserDetails getUserDetails(ResponseEntity<SysUserDetail> result) {
        if (result == null || result.getBody() == null) {
            throw new UsernameNotFoundException("用户不存在");
        }

        SysUserDetail info = result.getBody();
        Set<String> dbAuthsSet = new HashSet<>();
        if (ArrayUtil.isNotEmpty(info.getRoles())) {
            // 获取角色
            Arrays.stream(info.getRoles()).forEach(role -> dbAuthsSet.add(SecurityConstants.ROLE + role));
            // 获取资源
            dbAuthsSet.addAll(Arrays.asList(info.getPermissions()));
        }
        Collection<? extends GrantedAuthority> authorities
                = AuthorityUtils.createAuthorityList(dbAuthsSet.toArray(new String[0]));

        // 构造security用户
        return new AuthUser(info.getId(), info.getOffice().getId(), info.getLoginName(), info.getPassword(),
                true, true, true, true, authorities);
    }
}
