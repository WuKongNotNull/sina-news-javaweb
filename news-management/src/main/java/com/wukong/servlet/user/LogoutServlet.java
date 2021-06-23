package com.wukong.servlet;/*
author: 悟空非空也（B站/知乎/公众号） 
*/

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LogoutServlet", value = "/LogoutServlet")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 执行退出功能：将session 中的数据销毁掉
        HttpSession session = request.getSession();
        session.removeAttribute("userKey");
       // session.invalidate();

        // 页面跳转 响应重定向
        response.sendRedirect(request.getContextPath()+"/index.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            this.doGet(request,response);
    }
}
