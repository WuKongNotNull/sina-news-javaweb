package com.wukong.service;

import com.wukong.service.category.CategoryService;
import com.wukong.service.category.CategoryServiceImpl;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

/*
author: 悟空非空也（B站/知乎/公众号） 
*/
class CategoryServiceTest {
    CategoryService categoryService = new CategoryServiceImpl();

    @Test
    void getCategoryList() {
        System.out.println(categoryService.getCategoryList());
    }
}