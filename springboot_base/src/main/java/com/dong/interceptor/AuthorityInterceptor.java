package com.dong.interceptor;

import com.alibaba.fastjson.JSON;
import com.dong.constant.SessionConstant;
import com.dong.exception.CodeMsg;
import com.dong.pojo.Menu;
import com.dong.pojo.User;
import com.dong.service.MenuService;
import com.dong.utils.MenuUtil;
import com.dong.utils.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 后台权限统一管理拦截器
 * @author Administrator
 *
 */
@Component
public class AuthorityInterceptor implements HandlerInterceptor{

	@Autowired
	private MenuService menuService;

	private Logger log = LoggerFactory.getLogger(AuthorityInterceptor.class);
	
	@Override
	public boolean  preHandle(HttpServletRequest request, HttpServletResponse response, Object handler){
		String requestURI = request.getRequestURI();
		User user=(User)request.getSession().getAttribute(SessionConstant.USER_SESSION);
		log.info("进入权限控制拦截器" + requestURI);
		List<Menu> authorities = menuService.selectMenuByRole(user.getRole());
		if(!MenuUtil.isExistUrl(requestURI, authorities)){
			//进入这里，表示权限不存在，首先判断是否是ajax请求
			if(StringUtil.isAjax(request)){
				//表示是ajax请求
				try {
					log.info("该请求无权限，已ajax方式返回提示，url=" + requestURI);
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write(JSON.toJSONString(CodeMsg.ADMIN_NO_RIGHT));
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return false;
			}
			//说明是普通的请求，可直接重定向到无权限提示页面
			try {
				log.info("该请求无权限，重定向到无权限提示页面，url=" + requestURI);
				response.sendRedirect("/system/no_right");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return false;
		}
		log.info("该请求符合权限要求，放行" + requestURI);
		return true;
	}
}
