package com.wukong.servlet.admin;/*
author: 悟空非空也（B站/知乎/公众号） 
*/

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.wukong.pojo.Category;
import com.wukong.service.category.CategoryService;
import com.wukong.service.category.CategoryServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "GetCategoryListServlet", value = "/GetCategoryListServlet")
public class GetCategoryListServlet extends HttpServlet {
  private final   CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        List<Category> categoryList = categoryService.getCategoryList();
        // java 对象转换成 json字符串
        Object jsonObject =  JSONArray.toJSON(categoryList);
        String jsonStr = JSON.toJSONString(jsonObject);
        System.out.println("jsonStr--->"+jsonStr);
        response.getWriter().println(jsonStr);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
