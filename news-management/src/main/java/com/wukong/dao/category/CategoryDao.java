package com.wukong.dao.category;/*
author: 悟空非空也（B站/知乎/公众号） 
*/

import com.wukong.pojo.Category;

import java.util.List;

public interface CategoryDao {

    /**
     * 获得分类列表
     * @return
     */
   public List<Category> getCategoryList();


    /**
     * 分页查询分类列表
     *
     * @param pageNo   页码
     * @param pageSize 页容量
     * @return 分类列表
     */
    List<Category> getCategoryListPages(Integer pageNo, Integer pageSize);
}
