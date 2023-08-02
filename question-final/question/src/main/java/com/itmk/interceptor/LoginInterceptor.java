package com.itmk.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {
    private static final String LOGIN_URL = "/api/sysUser/login";
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String method = request.getMethod();
        //System.out.println("2222222:"+method);
        String requestURI = request.getRequestURI();
        //System.out.println(requestURI);
        //判断session里面的用户是否为空
        HttpSession session = request.getSession();
        Object user = session.getAttribute("user");
        if(user == null & !"/api/sysUser/registerCommit".equals(requestURI)){
            response.sendRedirect(LOGIN_URL);
        }
        return true;
    }
    @Override
	public void postHandle(HttpServletRequest req, HttpServletResponse res, Object arg2, ModelAndView arg3) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest req, HttpServletResponse res, Object arg2, Exception arg3) throws Exception {
	}
}
