package com.wukong.dao.comment;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

/*
author: 悟空非空也（B站/知乎/公众号） 
*/class CommentDaoTest {
   public final CommentDao commentDao = new CommentDaoImpl();

    @Test
    void getCommentListByNewsId() {
        System.out.println(commentDao.getCommentListByNewsId(1));
    }
}