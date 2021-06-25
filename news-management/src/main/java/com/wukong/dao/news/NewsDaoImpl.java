package com.wukong.dao.news;/* 
author: 悟空非空也（B站/知乎/公众号） 
*/

import com.wukong.pojo.News;
import com.wukong.util.JdbcUtil;
import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class NewsDaoImpl implements NewsDao {

    private final JdbcUtil jdbcUtil = new JdbcUtil();


    /**
     * 分页查询新闻详情
     *
     * @param currentNum 当前是第几页
     * @param pageSize   每页显示几条记录
     * @return
     */
    public List<News> getNewsListPages(Integer currentNum,Integer pageSize){

        String sql = "select * from news_detail limit ?,?";
        Object[] params = {(currentNum-1)*pageSize,pageSize};
        ResultSet resultSet = jdbcUtil.getObjectByParams(sql, params);

        ArrayList<News> newsList = new ArrayList<>();

        try {
            while (resultSet.next()){
                Integer id = resultSet.getInt("id");
                Integer categoryId = resultSet.getInt("categoryId");
                String title = resultSet.getString("title");
                String summary = resultSet.getString("summary");
                String content = resultSet.getString("content");
                String picPath = resultSet.getString("picPath");
                Integer createBy = resultSet.getInt("createBy");
                Date createDate = resultSet.getDate("createDate");
                Date modifyDate = resultSet.getDate("modifyDate");
                Integer modifyBy = resultSet.getInt("modifyBy");
                News news = new News();
                news.setId(id);
                news.setCategoryId(categoryId);
                news.setTitle(title);
                news.setSummary(summary);
                news.setContent(content);
                news.setPicPath(picPath);
                news.setCreateBy(createBy);
                news.setCreateDate(createDate);
                news.setModifyDate(modifyDate);
                news.setModifyBy(modifyBy);
                newsList.add(news);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            jdbcUtil.closeResource();
        }

        return  newsList;
    }

    /**
     * 在dao层，实现根据新闻id获得新闻详情
     *
     * @param newsId
     * @return
     */
    @Override
    public News getNewsById(Integer newsId) {
        String sql = "select * from news_detail where id = ?";
        Object [] params = {newsId};
        ResultSet resultSet = this.jdbcUtil.getObjectByParams(sql, params);

        News news = new News();

        try {
            while (resultSet.next()){
                Integer id = resultSet.getInt("id");
                Integer categoryId = resultSet.getInt("categoryId");
                String title = resultSet.getString("title");
                String summary = resultSet.getString("summary");
                String content = resultSet.getString("content");
                String picPath = resultSet.getString("picPath");
                Integer createBy = resultSet.getInt("createBy");
                Date createDate = resultSet.getDate("createDate");
                Date modifyDate = resultSet.getDate("modifyDate");
                Integer modifyBy = resultSet.getInt("modifyBy");
                news.setId(id);
                news.setCategoryId(categoryId);
                news.setTitle(title);
                news.setSummary(summary);
                news.setContent(content);
                news.setPicPath(picPath);
                news.setCreateBy(createBy);
                news.setCreateDate(createDate);
                news.setModifyDate(modifyDate);
                news.setModifyBy(modifyBy);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            jdbcUtil.closeResource();
        }
        return news;
    }
}
