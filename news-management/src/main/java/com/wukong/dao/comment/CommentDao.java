package com.wukong.dao.comment;/* 
author: 悟空非空也（B站/知乎/公众号） 
*/

import com.wukong.pojo.Comment;

import java.util.List;

public interface CommentDao {

    /**
     * 根据新闻id获得评论列表
     * @param newsId 新闻id
     * @return  返回评论列表
     */
  public   List<Comment> getCommentListByNewsId(Integer newsId);

    /**
     * 添加评论信息
     *
     * @param comment 评论对象
     * @return true|false 添加成功|添加失败
     */
   public boolean addComment(Comment comment);

    /**
     *  获得评论列表
     * @return 返回评论列表
     */
    List<Comment> getCommentList();

    /**
     * 分页查询评论列表
     *
     * @param pageNo   页码
     * @param pageSize 页容量
     * @return 评论列表
     */
    List<Comment> getCommentListPages(Integer pageNo, Integer pageSize);
}
