package com.dong.service;

import com.dong.mapper.CommentMapper;
import com.dong.pojo.Comment;
import com.dong.vo.CommentResult;
import com.dong.vo.PageResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {
    @Autowired
    private CommentMapper commentMapper;

    public List<CommentResult> selectCommentByGid(Integer id){
        return  commentMapper.selectCommentByGid(id);
    }

    public void saveComment(Comment comment){
        commentMapper.saveComment(comment);
    }

    public PageResult<CommentResult> selectPage(PageResult pageResult, String name) {
        PageHelper.startPage(pageResult.getCurrentPage(), pageResult.getPageSize());
        List<CommentResult> commentResults = commentMapper.selectPage(name);
        PageInfo pageInfo=new PageInfo(commentResults);
        return new PageResult<>(pageInfo.getPageNum(),pageInfo.getPageSize(),pageInfo.getPages(),pageInfo.getTotal(),commentResults);
    }

    public void deleteComment(Integer id){
        commentMapper.deleteComment(id);
    }
}
