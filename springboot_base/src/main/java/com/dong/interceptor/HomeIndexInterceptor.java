package com.dong.interceptor;

import com.dong.config.TitleConfig;
import com.dong.pojo.SiteSetting;
import com.dong.service.CategoryService;
import com.dong.service.SiteSettingService;
import com.dong.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class HomeIndexInterceptor implements HandlerInterceptor{

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private TitleConfig titleConfig;

    @Autowired
    private SiteSettingService siteSettingService;
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if(!StringUtil.isAjax(request)){
            request.setAttribute("categoryList", categoryService.selectAll());
            request.setAttribute("siteName", titleConfig.getHomeName());
            SiteSetting setting = siteSettingService.selectSite();
            if(setting!=null){
                request.setAttribute("siteName",setting.getSiteName());
                request.setAttribute("siteSetting",setting );
            }
        }
        return true;
    }
}
