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


}
