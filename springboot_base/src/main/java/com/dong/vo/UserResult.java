package com.dong.vo;

import com.dong.pojo.Role;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 扩展类
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserResult {
    private Integer id;

    private String username;

    private String password;

    private Integer sex;

    private Integer status;

    private String image;

    private String mobile;

    private String email;

    private Date createTime;

    private Role role;
}
