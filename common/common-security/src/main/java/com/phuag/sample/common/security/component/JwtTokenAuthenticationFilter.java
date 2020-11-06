package com.phuag.sample.common.security.component;

import com.phuag.sample.admin.api.entity.SysUser;
import com.phuag.sample.common.core.util.ThreadLocalUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.GenericFilterBean;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * @author phuag
 */
public class JwtTokenAuthenticationFilter extends GenericFilterBean {

    private JwtTokenProvider jwtTokenProvider;

    public JwtTokenAuthenticationFilter(JwtTokenProvider jwtTokenProvider) {
        this.jwtTokenProvider = jwtTokenProvider;
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain filterChain)
            throws IOException, ServletException {

        String token = jwtTokenProvider.resolveToken((HttpServletRequest) req);
        if (token != null && jwtTokenProvider.validateToken(token)) {
            Authentication auth = jwtTokenProvider.getAuthentication(token);

            if (auth != null) {
                SecurityContextHolder.getContext().setAuthentication(auth);
                SysUser principal = (SysUser) auth.getPrincipal();
                ThreadLocalUtils.put(ThreadLocalUtils.USER_ID, principal.getId());
                ThreadLocalUtils.put(ThreadLocalUtils.USER_NAME, principal.getName());
            }
        }
        filterChain.doFilter(req, res);
    }

}
