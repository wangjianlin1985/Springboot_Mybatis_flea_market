package com.dong.pojo;

import com.dong.annotion.Validata;
import lombok.Data;

import java.util.Date;

@Data
public class Category {

    private Integer id;

    @Validata(required = true,requiredLength = true,minLength = 2,maxLength = 18,errorRequiredMsg = "分类名不能为空!",errorMinLengthMsg = "分类名的长度不能少于2!",errorMaxLengthMsg = "分类名的长度不能大于18!")
    private String name;

    private Integer parentId;

    private String icon;

    private Date createTime;
}
