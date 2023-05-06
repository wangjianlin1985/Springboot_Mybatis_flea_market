package com.dong.utils;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;


public class StringUtil {
    
    //判断请求是否为ajax
    public static boolean isAjax(HttpServletRequest request){
        String header = request.getHeader("X-Requested-With");
        if("XMLHttpRequest".equals(header))return true;
        return false;
    }

    //时间转换
    public static String dataFormat(Date date,String format){
        SimpleDateFormat adf= new SimpleDateFormat(format);
        return adf.format(date);
    }
}
