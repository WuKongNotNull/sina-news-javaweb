package com.wukong.dao.user;
import com.wukong.pojo.User;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;
/*
author: 悟空非空也（B站/知乎/公众号） 
*/

class UserDaoTest {

    private UserDao userDao = new UserDaoImpl();

    @Test
    public void getUserByUsernameTest() {
        User user = userDao.getUserByUsername("admin");
        System.out.println(user);
    }
}