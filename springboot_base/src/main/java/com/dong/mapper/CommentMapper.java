package com.dong.mapper;

import com.dong.pojo.Comment;
import com.dong.vo.CommentResult;

import java.util.List;

public interface CommentMapper {
    List<CommentResult> selectCommentByGid(Integer id);

    void saveComment(Comment comment);

    List<CommentResult> selectPage(String name);

    void deleteComment(Integer id);
}
