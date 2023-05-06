package com.dong.service;

import com.dong.mapper.UserMapper;
import com.dong.pojo.User;
import com.dong.vo.PageResult;
import com.dong.vo.UserResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    public User selectUserByName(String username) {
       return userMapper.selectUserByName(username);
    }

    public Integer selectUserTotal(){
        return userMapper.selectUserTotal();
    }

    public List<User> selectAllUser(){
        return userMapper.selectAllUser();
    }

    public void updateUser(User user){
        userMapper.updateUser(user);
    }

    public PageResult<UserResult> selectPage(PageResult pageResult,User user){
        PageHelper.startPage(pageResult.getCurrentPage(), pageResult.getPageSize());
        List<UserResult> userResults = userMapper.selectUserRole(user);
        PageInfo pageInfo=new PageInfo(userResults);
        return new PageResult<UserResult>(pageInfo.getPageNum(),pageInfo.getPageSize(),pageInfo.getPages(),pageInfo.getTotal(),userResults);
    }

    public void saveUser(User user){
        userMapper.saveUser(user);
    }

    public User  selectUserById(Integer id){
        return userMapper.selectUserById(id);
    }

    public void deleteUser(Integer id){
        userMapper.deleteUser(id);
    }
}
