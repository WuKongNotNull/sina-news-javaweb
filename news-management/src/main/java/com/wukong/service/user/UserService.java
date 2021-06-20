package com.wukong.service.user;/* 
author: 悟空非空也（B站/知乎/公众号） 
*/

import com.wukong.pojo.User;

public interface UserService {

    /**
     * 根据登录信息（用户名和密码），验证该用户是否存在
     * @param username
     * @param password
     * @return
     */
    public User isExistUserByLogin(String username, String password);

}
