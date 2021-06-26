package com.wukong.service.comment;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

/*
author: 悟空非空也（B站/知乎/公众号） 
*/class CommentServiceTest {
    CommentService commentService = new CommentServiceImpl();
    @Test
    void getCommentListByNewsId() {
    }

    @Test
    void addComment() {
    }

    @Test
    void getCommentList() {
        System.out.println(this.commentService.getCommentList());
    }

    @Test
    void getCommentListPages(){
        System.out.println(commentService.getCommentListPages(1, 3));
    }
}