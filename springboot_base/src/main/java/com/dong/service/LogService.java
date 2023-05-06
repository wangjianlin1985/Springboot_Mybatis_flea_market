package com.dong.service;

import com.dong.constant.SessionConstant;
import com.dong.mapper.LogMapper;
import com.dong.pojo.Log;
import com.dong.pojo.User;
import com.dong.vo.PageResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.List;

@Service
public class LogService {

    @Autowired
    private LogMapper logMapper;


    public void addLog(String operator, String content) {
        Log log=new Log();
        log.setOperator(operator);
        log.setContent(content);
        logMapper.save(log);
    }

    public void addLog(String content) {
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        User user=(User) attributes.getRequest().getSession().getAttribute(SessionConstant.USER_SESSION);
        Log log=new Log();
        log.setOperator(user.getUsername());
        log.setContent(content);
        logMapper.save(log);
    }

    public Integer selectLogTotal(){
        return  logMapper.selectLogTotal();
    }

    public List<Log> selectRecentLog(){
        return logMapper.selectRecentLog();
    }

    public PageResult<Log> selectPage(Log log,PageResult pageResult){
        PageHelper.startPage(pageResult.getCurrentPage(),pageResult.getPageSize());
        List<Log> logList = logMapper.selectPage(log);
        PageInfo pageInfo=new PageInfo(logList);
        return new PageResult<>(pageInfo.getPageNum(),pageInfo.getPageSize(),pageInfo.getPages(),pageInfo.getTotal(),logList);
    }

    public void deleteLog(String ids){
        String[] idList = ids.split(",");
        for(String id:idList){
            logMapper.deleteLog(Integer.valueOf(id));
        }

    }

    public void deleteAll(){
        logMapper.deleteAll();
    }
}
