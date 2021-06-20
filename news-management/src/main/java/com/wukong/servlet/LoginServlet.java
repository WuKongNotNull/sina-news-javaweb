package com.wukong.servlet;

import com.wukong.pojo.User;
import com.wukong.service.user.UserService;
import com.wukong.service.user.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {

    private UserService userService = new UserServiceImpl();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        // 和数据库中的用户表进行登录验证
        String uname = request.getParameter("uname");
        String upassword = request.getParameter("upassword");
        User loginUser = userService.isExistUserByLogin(uname, upassword);
        // 将登录用户 存在session中(session 当中临时空间)
        HttpSession session = request.getSession();
        session.setAttribute("loginUser",loginUser);
        // 请求转发或者响应重定向
       // request.getRequestDispatcher("/index.jsp").forward(request,response);
        response.sendRedirect(request.getContextPath()+"/index.jsp");


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
