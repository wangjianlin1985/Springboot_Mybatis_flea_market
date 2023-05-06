package com.dong.pojo;

import com.dong.annotion.Validata;
import lombok.Data;

import java.util.Date;

@Data
public class Student {
    public final static int STUDENT_STATUS_ENABLE=1; //状态可用
    public  final static int STUDENT_STATUS_UNENABLE=0;  //状态不可用

    private Integer id;

    @Validata(required = true,requiredLength = true,minLength = 12,maxLength = 12,errorRequiredMsg = "学号不能为空!",errorMinLengthMsg = "学号的长度不能少于12!",errorMaxLengthMsg = "学号的长度不能大于12！")
    private String sno;

    @Validata(required = true,requiredLength = true,minLength = 6,maxLength = 24,errorRequiredMsg = "密码不能为空!",errorMinLengthMsg = "密码的长度不能少于6!",errorMaxLengthMsg = "密码的长度不能大于24！")
    private String password;

    private String image;

    @Validata(required = true,requiredLength = true,minLength = 1,maxLength = 16,errorRequiredMsg = "名字不能为空!",errorMinLengthMsg = "名字的长度不能少于1!",errorMaxLengthMsg = "密码的长度不能大于16！")
    private String name;

    private String mobile;

    private String wx;

    private String school;

    private String academy;

    private String grade;

    private Date createTime;

    private int status = STUDENT_STATUS_ENABLE;
}
