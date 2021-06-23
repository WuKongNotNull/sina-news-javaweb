package com.wukong.servlet.user;/*
author: 悟空非空也（B站/知乎/公众号） 
*/

import com.wukong.pojo.User;
import com.wukong.service.user.UserService;
import com.wukong.service.user.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DoRegisterServlet", value = "/DoRegisterServlet")
public class DoRegisterServlet extends HttpServlet {

    private  UserService  userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 进行注册处理
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");

        //获得浏览器传递过来的请求参数
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String con_password = request.getParameter("con_password");
        String email = request.getParameter("email");

        // 进行非空判断
        if (username ==null || password ==null || username.equals("") || password.equals("")){

            //给浏览器返回一个提示信息："用户名或密码不能为空"
            // 临时空间 request 生命周期 一次请求响应
           request.setAttribute("username_password_not_null","用户名或密码不能为空");
            // 页面跳转： 一定要用请求转发，因为它是一次请求
            request.getRequestDispatcher("/pages/userCreate.jsp").forward(request,response);

        }

        // 规定：用户名（账号）要唯一
        boolean is_exist = userService.isExistUsername(username);
        if (!is_exist){
            // 进行注册（添加用户的功能）
            User user = new User();
            user.setUsername(username);
            user.setPassword(password);
            user.setEmail(email);
            user.setUserType(1);
            boolean b = userService.addUser(user);
            // 如果添加成功，跳转新的页面 registerSuccess.jsp
            // 添加失败，跳转到新的页面  registerFail.jsp
            if(b){
                request.getRequestDispatcher("/pages/registerSuccess.jsp").forward(request,response);
            }else{
                response.sendRedirect(request.getContextPath()+"/pages/registerFail.jsp");
            }


        }else {
            // 给浏览器一个提示信息："用户名重复，请起一个新名字",提示语显示在
            request.setAttribute("duplicate_username","用户名重复，请起一个新名字");
            // 页面跳转： 一定要用请求转发，因为它是一次请求
            request.getRequestDispatcher("/pages/userCreate.jsp").forward(request,response);
        }








    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            this.doGet(request,response);
    }
}
