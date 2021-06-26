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


}
