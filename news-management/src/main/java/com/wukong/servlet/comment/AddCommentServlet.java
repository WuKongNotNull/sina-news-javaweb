package com.wukong.servlet.comment;/*
author: 悟空非空也（B站/知乎/公众号） 
*/

import com.alibaba.fastjson.JSONObject;
import com.wukong.pojo.Comment;
import com.wukong.service.comment.CommentService;
import com.wukong.service.comment.CommentServiceImpl;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet(name = "AddCommentServlet", value = "/AddCommentServlet")
public class AddCommentServlet extends HttpServlet {
    private CommentService commentService = new CommentServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            // 添加评论到数据库
        String commentJsonStr = request.getParameter("commentKey");
        System.out.println("commentJsonStr-->"+commentJsonStr);
        JSONObject jsonObject = JSONObject.parseObject(commentJsonStr);
        System.out.println("jsonObject-->"+jsonObject);

        Comment comment = JSONObject.toJavaObject(jsonObject, Comment.class);
        comment.setCreateDate(new Date());
        System.out.println("comment--->"+comment);
        boolean flag = this.commentService.addComment(comment);

        PrintWriter printWriter = response.getWriter();
        printWriter.println(flag);

    }
}
