package com.wukong.servlet.admin;/*
author: 悟空非空也（B站/知乎/公众号） 
*/

import com.wukong.pojo.User;
import com.wukong.service.user.UserService;
import com.wukong.service.user.UserServiceImpl;
import com.wukong.tool.Constant;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminLoginServlet", value = "/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    UserService userService = new UserServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("rememberMe");

        // 进行非空判断（后续补充）

        // 身份验证
        User user =this.userService.getAdminUserByUsernameAndPassword(username,password);

        if (user == null) {
            // 不存在该管理员用户
            request.setAttribute("usernamePasswordError","用户名或者密码错误");
            request.getRequestDispatcher("/jsp/admin/login.jsp").forward(request,response);
        }else {
            // 将用户信息存入session 容器中
            request.getSession().setAttribute(Constant.ADMIN_USER_SESSION,user);
            // 存在该用户，跳转到管理员首页
            response.sendRedirect(request.getContextPath()+"/jsp/admin/index.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
