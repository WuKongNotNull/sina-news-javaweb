package com.wukong.service;

import com.wukong.pojo.User;
import org.junit.jupiter.api.Test;

/*
author: 悟空非空也（B站/知乎/公众号） 
*/class UserServiceTest {

    private  UserService userService = new UserServiceImpl();


    @Test
    public void  addUser(){
        User user = new User();
        user.setUsername("testservice");
        user.setPassword("ssssss");
        boolean b = this.userService.addUser(user);
        System.out.println("service layer test result "+ b);


    }

    @Test
    public void isOnlyUsername(){
        boolean flag = this.userService.isExistUsername("tangseng");
        System.out.println("是否唯一呢："+ flag);
    }


    @Test
    void getUserByUsernameAndPassword() {
        User user = userService.getUserByUsernameAndPassword("wukong", "wukong");
        System.out.println(user);

    }
}