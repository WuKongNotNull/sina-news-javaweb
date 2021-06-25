package com.wukong.dao.user;/*
author: 悟空非空也（B站/知乎/公众号） 
*/

import com.wukong.pojo.User;

public interface UserDao {

    /**
     *  注册新用户（添加用户）
     * @param user 用户对象
     * @return  0 添加失败；1 添加成功
     */
    public boolean addUser(User user);

    /**
     *  验证用户名是否唯一
     * @param username
     * @return
     */
    public int  verifyOnlyUsername(String username);

    /**
     * 通过用户名查询用户信息;
     * 规定：username 唯一
     * @param username
     * @return
     */
    public User getUserByUsername(String username);


    /**
     * 根据id获得用户对象
     * @param id 用户id
     * @return 用户对象
     */
    public User getUserById(Integer id);

}
