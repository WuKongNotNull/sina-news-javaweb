package com.wukong.dao.user;/*
author: 悟空非空也（B站/知乎/公众号） 
*/

import com.wukong.pojo.User;
import org.junit.jupiter.api.Test;

public class UserDaoTest {

    private final UserDao userDao = new UserDaoImpl();

    @Test
    public void addUser(){
        User user = new User();
        user.setUsername("test");
        user.setPassword("test");
        user.setEmail("test@qq.com");
        user.setUserType(1);
        boolean b = userDao.addUser(user);
        System.out.println("添加用户成功了吗："+b);
    }

    @Test
    public void verifyOnlyUsername(){
        int i = userDao.verifyOnlyUsername("wukong");
        System.out.println("该用户出现的次数为：" + i);
    }



    @Test
    public void getUserByUsernameTest(){
        User wukongUser = userDao.getUserByUsername("wukong");
        System.out.println(wukongUser);
    }

    @Test
    public void getUserById(){
        System.out.println(this.userDao.getUserById(1));
    }

}
