package com.dong.mapper;

import com.dong.pojo.Log;

import java.util.List;

public interface LogMapper {
    void save(Log log);

    Integer selectLogTotal();

    List<Log> selectRecentLog();

    List<Log> selectPage(Log log);

    void deleteLog(Integer id);

    void deleteAll();
}
