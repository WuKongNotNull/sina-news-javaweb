package com.wukong.service.category;/* 
author: 悟空非空也（B站/知乎/公众号） 
*/

import com.wukong.dao.category.CategoryDao;
import com.wukong.dao.category.CategoryDaoImpl;
import com.wukong.pojo.Category;

import java.util.List;

public class CategoryServiceImpl  implements  CategoryService{

    private  final CategoryDao categoryDao = new CategoryDaoImpl();
    /**
     * 获得分类列表
     *
     * @return
     */
    @Override
    public List<Category> getCategoryList() {

        return categoryDao.getCategoryList();

    }
}
