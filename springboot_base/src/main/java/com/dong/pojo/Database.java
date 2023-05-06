package com.dong.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class Database {
    private Integer id;

    private String name;

    private String path;

    private Date  createTime;
}
