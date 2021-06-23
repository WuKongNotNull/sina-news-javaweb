package com.wukong.pojo;/*
author: 悟空非空也（B站/知乎/公众号） 
*/

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 实体类
 * 属性和表news_user 的字段一一对应
 *  `id`,`username`,`password`,`email`,`userType`
 */


@Setter
@Getter
@ToString
public class User {

    private  Integer id;
    private String username;
    private  String password;
    private String email;
    private Integer userType;


}
