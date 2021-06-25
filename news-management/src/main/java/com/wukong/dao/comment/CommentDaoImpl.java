package com.wukong.dao.comment;/* 
author: 悟空非空也（B站/知乎/公众号） 
*/

import com.wukong.pojo.Comment;
import com.wukong.util.JdbcUtil;

import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CommentDaoImpl implements CommentDao{
    public  final  JdbcUtil jdbcUtil = new JdbcUtil();
    /**
     * 根据新闻id获得评论列表
     *
     * @param newsId 新闻id
     * @return 返回评论列表
     */
    @Override
    public List<Comment> getCommentListByNewsId(Integer newsId) {
        String sql = "select * from news_comment where newsId = ?";
        Object[] params = {newsId};
        ResultSet resultSet = this.jdbcUtil.getObjectByParams(sql, params);

        List<Comment> commentList = new ArrayList<>();

        try {
            while (resultSet.next()){
                Integer id = resultSet.getInt("id");
                Integer newsId1 = resultSet.getInt("newsId");
                String content = resultSet.getString("content");
                Date createDate = resultSet.getDate("createDate");
                Integer createBy = resultSet.getInt("createBy");
                Date modifyDate = resultSet.getDate("modifyDate");
                Integer modifyBy = resultSet.getInt("modifyBy");
                Comment comment = new Comment();
                comment.setId(id);
                comment.setNewsId(newsId1);
                comment.setContent(content);
                comment.setCreateDate(createDate);
                comment.setCreateBy(createBy);
                comment.setModifyDate(modifyDate);
                comment.setModifyBy(modifyBy);
                commentList.add(comment);

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.jdbcUtil.closeResource();
        }
        return commentList;
    }

    /**
     * 添加评论信息
     *
     * @param comment 评论对象
     * @return true|false 添加成功|添加失败
     */
    @Override
    public boolean addComment(Comment comment) {
        String sql = "insert into news_comment(newsId,content,createDate,createBy,modifyDate,modifyBy)values(?,?,?,?,?,?)";
        Object [] params = {
                comment.getNewsId(),
                comment.getContent(),
                comment.getCreateDate(),
                comment.getCreateBy(),
                comment.getModifyDate(),
                comment.getModifyBy()
        };
        return this.jdbcUtil.addDeleteModify(sql, params);
    }
}
