package com.dong.mapper;

import com.dong.pojo.News;

import java.util.List;

public interface NewsMapper {
     void  save(News news);

     List<News> selectPage(String title);

     void updateNews(News news);

     void deleteNews(Integer id);

     News selectNewsById(Integer id);

}
