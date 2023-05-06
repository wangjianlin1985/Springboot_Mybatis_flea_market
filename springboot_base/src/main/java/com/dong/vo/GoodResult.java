package com.dong.vo;

import com.dong.pojo.Category;
import com.dong.pojo.Student;
import lombok.Data;

import java.util.Date;

@Data
public class GoodResult {

    private Integer id;

    private String name;

    private String describle;

    private Float price;

    private String photo;

    private Integer status;

    private Integer viewNumber;

    private Date createTime;

    private Student student;

    private Category category;


}
