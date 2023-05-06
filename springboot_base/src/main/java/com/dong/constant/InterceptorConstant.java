package com.dong.constant;

import java.util.Arrays;
import java.util.List;

public class InterceptorConstant {

    /**
     * 后台登录拦截器无需拦截的请求
     */
    public final static List<String> LoginExcludePathPatterns= Arrays.asList(
            "/system/login",
            "/system/login_form",
            "/admin/css/**",
            "/admin/fonts/**",
            "/admin/images/**",
            "/photo/upload_photo",
            "/admin/js/**",
            "/photo/view",
            "/cpacha//generate_cpacha",
            "/error/**",
            "/home/**"

    );

    /**
     * 后台权限拦截器无需拦截的请求
     */
    public final static List<String> authorityExcludePathPatterns=Arrays.asList(
            "/system/login",
            "/system//login_form",
            "/system/index",
            "/system/no_right",
            "/admin/css/**",
            "/admin/fonts/**",
            "/admin/js/**",
            "/admin/images/**",
            "/error",
            "/photo/upload_photo",
            "/cpacha/generate_cpacha",
            "/system/logout",
            "/system/update_userinfo",
            "/system/update_pwd",
            "/photo/view",
            "/home/**"
    );

    //前台全局拦截器无需拦截的url
    public static List<String> homeGlobalExcludePathPatterns = Arrays.asList(
            "/system/**",
            "/admin/**",
            "/error",
            "/cpacha/generate_cpacha",
            "/photo/view"
    );

    /**
     * 前台无需拦截的请求
     */
    public final static List<String> homeLoginExcludePathPatterns = Arrays.asList(
            "/system/**",
            "/admin/**",
            "/druid",
            "/error",
            "/cpacha/generate_cpacha",
            "/photo/upload_photo",
            "/photo/view",
            "/home/index/**",
            "/home/goods/**",
            "/home/cart/**",
            "/home/js/**",
            "/home/css/**",
            "/home/imgs/**"
    );
}
