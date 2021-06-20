package com.wukong.dao.user;/*
author: 悟空非空也（B站/知乎/公众号） 
*/

import com.wukong.pojo.User;
import com.wukong.util.JdbcUtil;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDaoImpl implements  UserDao{

    private  JdbcUtil jdbcUtil = new JdbcUtil();

    /**
     * 规定：用户名唯一
     * 根据用户名查询用户信息
     * @param username 用户名
     * @return  User
     */
    public User getUserByUsername(String username){
        jdbcUtil.getConnection();
        String sql = "select * from news_user where username =?";
        Object [] params = {username};
        ResultSet resultSet = jdbcUtil.getObjectByParams(sql, params);
       try{
           while(resultSet.next()){
               Integer id = resultSet.getInt("id");
               String username1 = resultSet.getString("username");
               String password = resultSet.getString("password");
               String email = resultSet.getString("email");
               Integer userType = resultSet.getInt("userType");
               User user = new User();
               user.setId(id);
               user.setUsername(username1);
               user.setPassword(password);
               user.setEmail(email);
               user.setUserType(userType);
               return  user;
           }
       }catch (Exception e){
           e.printStackTrace();
       }
       return  null;

    }


}
