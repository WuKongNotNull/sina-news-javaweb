package com.wukong.servlet.admin;/*
author: 悟空非空也（B站/知乎/公众号） 
*/

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.wukong.pojo.News;
import com.wukong.service.news.NewsService;
import com.wukong.service.news.NewsServiceImpl;
import com.wukong.tool.Constant;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "GetNewsListPagesByCategoryIdServlet", value = "/GetNewsListPagesByCategoryIdServlet")
public class GetNewsListPagesByCategoryIdServlet extends HttpServlet {
    NewsService newsService = new NewsServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        Integer categoryId = Integer.parseInt(request.getParameter("categoryId"));
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
        List<News> newsListPages = newsService.getNewsListPagesByCategoryId(categoryId, pageSize, Constant.PAGE_SIZE);

        // java对象转换成json字符串，传递到客户端(浏览器)
        Object o = JSONArray.toJSON(newsListPages);
        String s = JSON.toJSONString(o);

        response.getWriter().println(s);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
