package com.wukong.dao.news;

import com.wukong.pojo.News;
import org.junit.jupiter.api.Test;

import java.util.List;


/*
author: 悟空非空也（B站/知乎/公众号） 
*/class NewsDaoTest {

    private final NewsDao newsDao = new NewsDaoImpl();


    @Test
    void getNewsListPages() {
        List<News> newsListPages = this.newsDao.getNewsListPages(1, 4);
        System.out.println(newsListPages);

    }



   @Test
    public void getNewsById(){
       System.out.println(this.newsDao.getNewsById(1));
   }
}