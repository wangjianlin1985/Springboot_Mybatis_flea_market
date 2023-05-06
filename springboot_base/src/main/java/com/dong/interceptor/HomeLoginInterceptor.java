package com.dong.interceptor;

import com.alibaba.fastjson.JSON;
import com.dong.constant.SessionConstant;
import com.dong.exception.CodeMsg;
import com.dong.pojo.Student;
import com.dong.utils.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@Component
public class HomeLoginInterceptor implements HandlerInterceptor {


    private Logger log = LoggerFactory.getLogger(HandlerInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String requestURI = request.getRequestURI();
        Student student = (Student) request.getSession().getAttribute(SessionConstant.STUDENT_SESSION);
        if (StringUtils.isEmpty(student)) {
            log.info("学生还未登录或者session失效,重定向到登录页面,拦截当前的URL=" + requestURI);
            if (StringUtil.isAjax(request)) {
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(JSON.toJSONString(CodeMsg.USER_SESSION_EXPIRED));
            }
            response.sendRedirect("/home/index/login");
            return false;
        }
        log.info("该请求符合前台登录拦截器的要求,放行:" +requestURI);
        return true;
    }
}
