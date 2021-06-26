package com.wukong.servlet.category;/*
author: 悟空非空也（B站/知乎/公众号） 
*/

import com.wukong.pojo.News;
import com.wukong.service.news.NewsService;
import com.wukong.service.news.NewsServiceImpl;
import com.wukong.tool.Constant;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ShowNewsListPagesServlet", value = "/ShowNewsListPagesServlet")
public class ShowNewsListPagesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Integer categoryId = Integer.parseInt(request.getParameter("categoryId"));
        int pageNo = Integer.parseInt(request.getParameter("pageNo"));

        if (pageNo<=0){
            pageNo=1;
        }

        // 根据分类id 获得新闻列表
        NewsService newsService = new NewsServiceImpl();
        List<News> newsList  = newsService.getNewsListPagesByCategoryId(categoryId,pageNo, Constant.PAGE_SIZE);

        // 将新闻列表存到request 储存容器中，然后进行页面跳转
        request.setAttribute("newsListPagesKey",newsList);
        request.setAttribute("pageNoKey",pageNo);
        request.setAttribute("categoryIdKey",categoryId);
        request.getRequestDispatcher("/index.jsp").forward(request,response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            this.doGet(request, response);
    }
}
