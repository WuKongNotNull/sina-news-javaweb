package com.wukong.dao.category;/* 
author: 悟空非空也（B站/知乎/公众号） 
*/

import com.wukong.pojo.Category;
import com.wukong.util.JdbcUtil;

import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoryDaoImpl implements CategoryDao {

    private  final JdbcUtil jdbcUtil = new JdbcUtil();

    /**
     * 获得分类列表
     *
     * @return
     */
    @Override
    public List<Category> getCategoryList() {
        String sql = "select * from news_category";
        Object [] params = {};
        ResultSet resultSet = this.jdbcUtil.getObjectByParams(sql, params);
        List<Category> categoryList = new ArrayList<>();
        try {
            while (resultSet.next()){
                Integer id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                Date createDate = resultSet.getDate("createDate");
                Integer createBy = resultSet.getInt("createBy");
                Date modifyDate = resultSet.getDate("modifyDate");
                Integer modifyBy = resultSet.getInt("modifyBy");

                Category category = new Category();
                category.setId(id);
                category.setName(name);
                category.setCreateDate(createDate);
                category.setCreateBy(createBy);
                category.setModifyDate(modifyDate);
                category.setModifyBy(modifyBy);

                categoryList.add(category);

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            jdbcUtil.closeResource();
        }
            return categoryList;
    }

    /**
     * 分页查询分类列表
     *
     * @param pageNo   页码
     * @param pageSize 页容量
     * @return 分类列表
     */
    public List<Category> getCategoryListPages(Integer pageNo, Integer pageSize) {

        String sql = "select * from news_category order by createDate desc limit ?,?";
        Object [] params = {(pageNo-1)*pageSize,pageSize};
        ResultSet resultSet = this.jdbcUtil.getObjectByParams(sql, params);

        List<Category> categoryList = new ArrayList<>();
        try {
            while (resultSet.next()){
                Integer id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                Date createDate = resultSet.getDate("createDate");
                Integer createBy = resultSet.getInt("createBy");
                Date modifyDate = resultSet.getDate("modifyDate");
                Integer modifyBy = resultSet.getInt("modifyBy");

                Category category = new Category();
                category.setId(id);
                category.setName(name);
                category.setCreateDate(createDate);
                category.setCreateBy(createBy);
                category.setModifyDate(modifyDate);
                category.setModifyBy(modifyBy);

                categoryList.add(category);

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            jdbcUtil.closeResource();
        }
        return categoryList;
    }
}
