package com.dong.vo;

import com.dong.pojo.Good;
import com.dong.pojo.Student;
import lombok.Data;

import java.util.Date;

@Data
public class CommentResult {
    private Integer id;

    private String content;

    private String reply;

    private Date createTime;

    private Student student;

    private Good good;
}
