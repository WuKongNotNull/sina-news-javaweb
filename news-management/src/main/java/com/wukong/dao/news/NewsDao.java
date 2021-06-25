package com.wukong.dao.news;/* 
author: 悟空非空也（B站/知乎/公众号） 
*/

import com.wukong.pojo.News;
import java.util.List;

public interface NewsDao {

    /**
     * 分页查询新闻详情
     *
     * @param currentNum 当前是第几页
     * @param pageSize   每页显示几条记录
     * @return
     */
    public List<News> getNewsListPages(Integer currentNum, Integer pageSize);


    /**
     * 在dao层，实现根据新闻id获得新闻详情
     * @param newsId
     * @return
     */
    public News getNewsById(Integer newsId);

}
