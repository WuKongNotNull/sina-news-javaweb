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

    /**
     * 分页查询分类列表
     *
     * @param pageNo   页码
     * @param pageSize 页容量
     * @return 分类列表
     */
    @Override
    public List<Category> getCategoryListPages(Integer pageNo, Integer pageSize) {

        return this.categoryDao.getCategoryListPages(pageNo,pageSize);
    }
}
