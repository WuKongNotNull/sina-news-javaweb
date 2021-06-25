package com.wukong.service.comment;/*
author: 悟空非空也（B站/知乎/公众号） 
*/

import com.wukong.pojo.Comment;

import java.util.List;

public interface CommentService {

    /**
     * 根据新闻id 查询关联的评论列表
     * @param newsId 新闻id
     * @return  评论列表
     */
  public  List<Comment> getCommentListByNewsId(Integer newsId);

    /**
     * 添加评论信息
     * @param comment 评论对象
     * @return true|false 添加成功|添加失败
     */
    boolean addComment(Comment comment);
}
