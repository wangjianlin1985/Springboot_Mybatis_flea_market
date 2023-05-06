package com.dong.pojo;

import com.dong.annotion.Validata;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * (Comment)实体类
 *
 * @author makejava
 * @since 2020-07-18 14:30:31
 */
@Data
public class Comment implements Serializable {
    private static final long serialVersionUID = 593516981016198300L;
    
    private Integer id;

    @Validata(required = true,requiredLength = true,minValue = 1,maxLength = 500,errorMinLengthMsg = "评论的长度不能少于1!",errorMaxLengthMsg = "评论的长度不能大于500!")
    private String content;
    
    private Integer studentId;
    
    private Integer goodId;
    
    private String reply;
    
    private Date createTime;


}