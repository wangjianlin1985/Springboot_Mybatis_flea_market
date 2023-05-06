package com.dong.interceptor;

import com.alibaba.fastjson.JSON;
import com.dong.config.TitleConfig;
import com.dong.constant.SessionConstant;
import com.dong.exception.CodeMsg;
import com.dong.pojo.Menu;
import com.dong.pojo.User;
import com.dong.service.RoleService;
import com.dong.utils.MenuUtil;
import com.dong.utils.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 后台登录拦截器
 */

@Component
public class AdminLoginInterceptor implements HandlerInterceptor {

    @Autowired
    private TitleConfig titleConfig;


    @Autowired
    private RoleService roleService;

    Logger logger=LoggerFactory.getLogger(AdminLoginInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String requestURI = request.getRequestURI();
        User user  =(User)request.getSession().getAttribute(SessionConstant.USER_SESSION);
        if(StringUtils.isEmpty(user)){
            logger.info("用户还未登录或者session失效,重定向到登录页面,拦截当前的URL=" + requestURI);
            if(StringUtil.isAjax(request)){
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(JSON.toJSONString(CodeMsg.USER_SESSION_EXPIRED));
            }
            response.sendRedirect("/system/login");
            return false;
        }


        logger.info("当前URL["+requestURI+"]没有被拦截");
        if(!StringUtil.isAjax(request)){
            List<Menu> menus = roleService.selectMenuByRole(user.getRole());
            request.setAttribute("siteName", titleConfig.getSysName());
            request.setAttribute("userTopMenus", MenuUtil.getTopMenus(menus));
            List<Menu> secondMenus = MenuUtil.getSecondMenus(menus);
            request.setAttribute("userSecondMenus", secondMenus);
            request.setAttribute("userThirdMenus", MenuUtil.getChildren(MenuUtil.getMenuIdByUrl(requestURI, secondMenus), MenuUtil.getThirdMenus(menus)));
        }
        return true;
    }
}
