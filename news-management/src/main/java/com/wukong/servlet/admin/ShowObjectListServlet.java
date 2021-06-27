package com.wukong.servlet.admin;/*
author: 悟空非空也（B站/知乎/公众号） 
*/

import com.sun.tools.internal.jxc.ap.Const;
import com.wukong.pojo.Category;
import com.wukong.pojo.Comment;
import com.wukong.pojo.News;
import com.wukong.pojo.User;
import com.wukong.service.category.CategoryService;
import com.wukong.service.category.CategoryServiceImpl;
import com.wukong.service.comment.CommentService;
import com.wukong.service.comment.CommentServiceImpl;
import com.wukong.service.news.NewsService;
import com.wukong.service.news.NewsServiceImpl;
import com.wukong.service.user.UserService;
import com.wukong.service.user.UserServiceImpl;
import com.wukong.tool.Constant;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ShowObjectListServlet", value = "/ShowObjectListServlet")
public class ShowObjectListServlet extends HttpServlet {
    NewsService newsService = new NewsServiceImpl();
    CategoryService categoryService = new CategoryServiceImpl();
    CommentService commentService = new CommentServiceImpl();
    UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String entity = request.getParameter("entity");
        String pageNoStr = request.getParameter("pageNo");


        Integer pageNo = null;
        if (pageNoStr !=null){
             pageNo = Integer.parseInt(pageNoStr);
        }

        switch (entity) {
            case "news":
                List<News> newsListPages = newsService.getNewsListPages(pageNo, Constant.PAGE_SIZE);
                // 将新闻列表存到request 储存容器中，然后进行页面跳转
                request.setAttribute("newsListPagesKey", newsListPages);

                break;
            case "category":
                List<Category> categoryList = categoryService.getCategoryListPages(pageNo, Constant.PAGE_SIZE);
                request.setAttribute("categoryListKey", categoryList);

                break;
            case "comment":
                List<Comment> commentListPages = commentService.getCommentListPages(pageNo, Constant.PAGE_SIZE);
                request.setAttribute("commentListPagesKey", commentListPages);
                break;
            case "user":
                List<User> userList = userService.getUserListPages(pageNo, Constant.PAGE_SIZE);
                request.setAttribute("userListKey", userList);
                break;
            default:
                System.out.println("该实体类未知，请核实！");
                break;
        }


        request.setAttribute("pageNoKey",pageNo);
        request.setAttribute("entityKey",entity);
        request.getRequestDispatcher("/jsp/admin/index.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
