package com.wukong.service;/*
author: 悟空非空也（B站/知乎/公众号） 
*/

import com.wukong.pojo.User;

public interface UserService {

    /**
     * 注册用户
     * @param user
     * @return
     */
    public boolean addUser(User user);


    /**
     * 进行用户名唯一验证
     * @param username  用户名
     * @return  true/false
     */
    public boolean isExistUsername(String username);

    /**
     * 根据用户名和密码验证用户
     * @param username  客户端传过来的username
     * @param password  客户端传过来的password
     * @return user
     */
    public User getUserByUsernameAndPassword(String username, String password);



}
