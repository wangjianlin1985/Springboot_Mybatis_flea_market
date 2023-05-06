package com.dong.config;

import com.dong.constant.InterceptorConstant;
import com.dong.interceptor.AdminLoginInterceptor;
import com.dong.interceptor.AuthorityInterceptor;
import com.dong.interceptor.HomeIndexInterceptor;
import com.dong.interceptor.HomeLoginInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 扩展WebMvc配置类
 */

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Autowired
    private AdminLoginInterceptor adminLoginInterceptor;

    @Autowired
    private AuthorityInterceptor authorityInterceptor;

    @Autowired
    private HomeLoginInterceptor homeLoginInterceptor;

    @Autowired
    private HomeIndexInterceptor homeIndexInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(homeIndexInterceptor).addPathPatterns("/**").excludePathPatterns(InterceptorConstant.homeGlobalExcludePathPatterns);
        registry.addInterceptor(homeLoginInterceptor).addPathPatterns("/**").excludePathPatterns(InterceptorConstant.homeLoginExcludePathPatterns);
        registry.addInterceptor(adminLoginInterceptor).addPathPatterns("/**").excludePathPatterns(InterceptorConstant.LoginExcludePathPatterns);
        registry.addInterceptor(authorityInterceptor).addPathPatterns("/**").excludePathPatterns(InterceptorConstant.authorityExcludePathPatterns);
    }



    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("system/userinfo").setViewName("admin/system/update_userinfo");
        registry.addViewController("system/login").setViewName("admin/system/login");
        registry.addViewController("system/userPwd").setViewName("admin/system/update_pwd");
        registry.addViewController("system/no_right").setViewName("admin/system/no_right");
        registry.addViewController("home/student/goPublish").setViewName("/home/student/publish");
    }


}
