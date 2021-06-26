package com.wukong.service.news;/* 
author: 悟空非空也（B站/知乎/公众号） 
*/

import com.wukong.pojo.News;

import java.util.List;

public interface NewsService {

    /**
     *  分页查询新闻列表
     * @param currentNo
     * @param pageSize
     * @return
     */
    public List<News> getNewsListPages(Integer currentNo, Integer pageSize);


    /**
     *  根据新闻id 获得新闻详情
     * @param newsId
     * @return
     */
    public News getNewsById(Integer newsId);

    /**
     * 根据分类id 获得新闻列表
     *
     * @param categoryId  分类id
     * @param pageNo  页码
     * @param pageSize 页容量
     * @return  返回新闻列表
     */
    public   List<News> getNewsListPagesByCategoryId(Integer categoryId, Integer pageNo, Integer pageSize);
}
