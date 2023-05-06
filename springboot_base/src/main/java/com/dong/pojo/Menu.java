package com.dong.pojo;

import com.dong.annotion.Validata;
import lombok.Data;

import java.util.Date;

/**
 * 菜单实体类
 */
@Data
public class Menu {
    private Integer id;

    @Validata(required = true,requiredLength = true,minLength = 1,maxLength = 18,
            errorMinLengthMsg = "菜单名称长度不能小于1",errorMaxLengthMsg = "菜单名称长度不能大于18")
    private String name;

    private String url;


    private Integer parent;

    private String icon;

    private Boolean show;

    private Boolean button;

    private Date createTime;
}
