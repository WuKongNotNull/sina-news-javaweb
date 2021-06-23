package com.wukong.servlet.user;/*
author: 悟空非空也（B站/知乎/公众号） 
*/

import com.wukong.pojo.User;
import com.wukong.service.user.UserService;
import com.wukong.service.user.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {

    private UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       request.setCharacterEncoding("utf-8");
       response.setContentType("text/html;charset=UTF-8");

        // 接受表单中的请求参数
        String username = request.getParameter("uname");
        String password = request.getParameter("upassword");
        String rememberMe = request.getParameter("rememberMe");
        //TODO 对用户名和密码进行非空判断 （以后补充）



        // 调用 service 中的方法 user 为null 表示 登录失败 为not null 表示该用户确实存在
        User user = userService.getUserByUsernameAndPassword(username, password);


        if (rememberMe !=null && rememberMe.equals("1")){
                /*
            将user对象存到 cookie 容器中
            在服务器创建cookie对象
             */
                Cookie cookie = new Cookie("usernameKey",user.getUsername());
                Cookie cookie2 = new Cookie("passwordKey", user.getPassword());
                cookie.setPath("/");
                cookie.setMaxAge(60*60*24);  // 自定义设置 24 小时
                // 将服务器中的cookie对象响 应到客户端的storage存储空间中，存储在客户端
                response.addCookie(cookie);
                response.addCookie(cookie2);
        }


        // session  临时数据库（存储空间），的保存k-v 对数据，默认时间30分钟 作用域可以跨文件
        HttpSession session = request.getSession();
        System.out.println("默认最大不活跃间隔时间为："+ session.getMaxInactiveInterval());
        session.setAttribute("userKey",user);

        // 返回一个页面（页面的跳转） 请求转发 响应重定向
        response.sendRedirect(request.getContextPath()+"/index.jsp");


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            this.doGet(request,response);
    }

}
