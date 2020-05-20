package com.phuag.sample.auth.security;

import com.phuag.sample.auth.dao.SysUserMapper;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

/**
 * @author phuag
 */
@Component
public class CustomUserDetailsService implements UserDetailsService {

    private SysUserMapper users;

    public CustomUserDetailsService(SysUserMapper users) {
        this.users = users;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return this.users.selectSysUserByLoginName(username)
            .orElseThrow(() -> new UsernameNotFoundException("Username: " + username + " not found"));
    }
}
