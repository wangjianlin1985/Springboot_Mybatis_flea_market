package com.dong.pojo;

import com.dong.annotion.Validata;
import lombok.Data;

import java.util.Date;

/**
 * 管理员实体类
 */
@Data
public class User {

    public static final int ADMIN_USER_STATUS_ENABLE = 1;//用户状态正常可用
    public static final int ADMIN_USER_STATUS_UNABLE = 0;//用户状态不可用

    private Integer id;

    @Validata(required = true,requiredLength =true,maxLength = 18,minLength = 2,errorRequiredMsg = "用户名不能为空!",errorMinLengthMsg="用户名长度需大于2!",errorMaxLengthMsg="用户名长度不能大于18!")
    private String username;

    @Validata(required = true,requiredLength = true,maxLength = 24,minLength = 6,errorRequiredMsg = "密码不能为空!",errorMinLengthMsg = "密码长度不能少于6位!",errorMaxLengthMsg = "密码长度不能大于24!")
    private String password;

    private Integer sex;

    private Integer status;

    private String image;

    private String mobile;

    private String email;

    private Date creatTime;

    private Integer role;


}
