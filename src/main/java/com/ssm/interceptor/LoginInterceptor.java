package com.ssm.interceptor;

import com.ssm.entity.TUser;
import com.ssm.utils.UserUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        TUser currentUser = UserUtils.getCurrentUser(request);
        if(currentUser == null ){
            // 没有登录
            response.sendRedirect("/login");
            return false;
        }else
            return true;
    }
}
