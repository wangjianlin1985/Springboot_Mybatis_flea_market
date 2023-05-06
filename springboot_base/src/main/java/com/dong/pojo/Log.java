package com.dong.pojo;

import lombok.Data;

import java.util.Date;

/**
 * 日志实体类
 */
@Data
public class Log {
    private Integer id;
    private String operator;
    private String content;
    private Date createTime;


}
