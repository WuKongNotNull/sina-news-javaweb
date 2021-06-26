package com.wukong.service.news;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

/*
author: 悟空非空也（B站/知乎/公众号） 
*/class NewsServiceTest {
    private  final  NewsService newsService = new NewsServiceImpl();

    @Test
    void getNewsListPages() {
    }

    @Test
    void getNewsById() {
    }

    @Test
    void getNewsListPagesByCategoryId() {
        System.out.println(newsService.getNewsListPagesByCategoryId(null, null, 5));
    }
}