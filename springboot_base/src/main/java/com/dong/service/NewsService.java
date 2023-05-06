package com.dong.service;

import com.dong.mapper.NewsMapper;
import com.dong.pojo.News;
import com.dong.vo.PageResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewsService {

    @Autowired
    private NewsMapper newsMapper;

    public void  save(News news){
        newsMapper.save(news);
    }

    public PageResult<News> selectPage(PageResult pageResult, String title){
        PageHelper.startPage(pageResult.getCurrentPage(), pageResult.getPageSize());
        List<News> news = newsMapper.selectPage(title);
        PageInfo pageInfo=new PageInfo(news);
        return new PageResult<>(pageInfo.getPageNum(), pageInfo.getPageSize(), pageInfo.getPages(), pageInfo.getTotal(),news);
    }

    public void updateNews(News news){
        newsMapper.updateNews(news);
    }

    public void deleteNews(Integer id){
        newsMapper.deleteNews(id);
    }

    public News selectNewsById(Integer id){
        return newsMapper.selectNewsById(id);
    }
}
