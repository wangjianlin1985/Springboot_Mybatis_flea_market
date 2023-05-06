package com.dong.pojo;

import com.dong.annotion.Validata;
import lombok.Data;

import java.util.Date;
import java.io.Serializable;

/**
 * (News)实体类
 *
 * @author makejava
 * @since 2020-07-23 15:59:19
 */
@Data
public class News implements Serializable {
    private static final long serialVersionUID = 228556020643059492L;
    
    private Integer id;

    @Validata(required = true,requiredLength = true,minLength = 1,maxLength = 64,errorRequiredMsg = "新闻标题不能为空!",errorMinLengthMsg = "新闻标题的长度不能少于1!",errorMaxLengthMsg = "新闻标题长度的长度不能大于64！")
    private String title;

    @Validata(required = true,requiredLength = true,minLength = 1,maxLength = 10000,errorRequiredMsg = "新闻内容不能为空!",errorMinLengthMsg = "新闻标题的长度不能少于1!",errorMaxLengthMsg = "新闻标题长度的长度不能大于10000！")
    private String content;
    
    private Integer viewNumber;
    
    private Date createTime;


}