package com.wukong.service.user;/*
author: 悟空非空也（B站/知乎/公众号） 
*/

import com.wukong.pojo.User;

import java.util.List;

public interface UserService {

    /**
     * 注册用户
     * @param user user
     * @return boolean
     */
     boolean addUser(User user);


    /**
     * 进行用户名唯一验证
     * @param username  用户名
     * @return  true/false
     */
     boolean isExistUsername(String username);

    /**
     * 根据用户名和密码验证用户
     * @param username  客户端传过来的username
     * @param password  客户端传过来的password
     * @return user
     */
     User getUserByUsernameAndPassword(String username, String password);


    /**
     * 根据用户id 获得用户信息
     * @param id 用户id
     * @return 返回用户对象
     */
     User getUserById(Integer id);

    /**
     *  根据用户名和密码验证管理员用户是否存在
     * @param username 用户名
     * @param password 密码
     * @return 返回管理员用户对象
     */
    User getAdminUserByUsernameAndPassword(String username, String password);

    /**
     * 分页查询用户列表
     * @param pageNo 页码
     * @param pageSize 页容量
     * @return 用户列表
     */
    List<User> getUserListPages(Integer pageNo, Integer pageSize);
}
