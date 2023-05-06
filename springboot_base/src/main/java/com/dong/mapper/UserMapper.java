package com.dong.mapper;

import com.dong.pojo.User;
import com.dong.vo.UserResult;

import java.util.List;


public interface UserMapper {
    User selectUserByName(String username);

    List<User> selectAllUser();

    Integer selectUserTotal();

    void updateUser(User user);

    List<UserResult> selectUserRole(User user);

    void saveUser(User user);

    User selectUserById(Integer id);
    
    void deleteUser(Integer id);
}
