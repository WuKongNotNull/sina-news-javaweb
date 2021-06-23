package com.wukong.service.news;/* 
author: 悟空非空也（B站/知乎/公众号） 
*/

import com.wukong.dao.news.NewsDao;
import com.wukong.dao.news.NewsDaoImpl;
import com.wukong.pojo.News;

import java.util.List;

public class NewsServiceImpl  implements  NewsService{

    private NewsDao newsDao = new NewsDaoImpl();

    /**
     *  分页查询新闻列表
     * @param currentNo
     * @param pageSize
     * @return
     */
    public List<News> getNewsListPages(Integer currentNo, Integer pageSize){
        return  this.newsDao.getNewsListPages(currentNo, pageSize);
    }

}
