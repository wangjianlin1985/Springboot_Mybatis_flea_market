package com.dong.pojo;

import com.dong.annotion.Validata;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 角色实体类
 *
 */
@Data
public class Role implements Serializable {
    private static final long serialVersionUID = 686312345283941081L;
    
    private Integer id;

    @Validata(required = true,requiredLength = true,maxLength = 18,minLength =2,errorRequiredMsg = "角色名字不能为空",errorMinLengthMsg = "角色名字长度不能少于2!",errorMaxValueMsg = "角色名字长度不能大于18!")
    private String name;
    
    private String remark;

    private Date createTime;

}