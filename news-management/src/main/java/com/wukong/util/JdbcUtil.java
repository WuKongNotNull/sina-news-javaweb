package com.wukong.util;
/* author: 悟空非空也（B站/知乎/公众号） */


import com.wukong.pojo.User;

import java.sql.*;
import java.util.ArrayList;


public class JdbcUtil {
   private Connection connection;
   private PreparedStatement preparedStatement;
    private ResultSet resultSet;

     // 连接数据库 jdbc  java database  connection
    public boolean getConnection()  {
        // 读出配置信息  com.mysql.jdbc.Driver
        String driver = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:mysql://127.0.0.1:3306/news?serverTimezone=GMT&characterEncoding=utf-8";
        String username = "root";
        String password = "rootroot";

        try {
            // 加载jdbc驱动
            Class.forName(driver);
            // 创建与数据库的连接对象
            connection = DriverManager.getConnection(url, username, password);
            return true;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return false;
        }

    }

    // 代码的重构
    public  boolean addDeleteModify(String sql,Object[] params){
        /*
        INSERT INTO qq_user(username,`password`,email,hobbies)VALUES(?,?,?,?)
        delete from qq_user where id = ?

         */
        if(this.getConnection()){
            try {
                preparedStatement = connection.prepareStatement(sql);
                //给占位符赋值
                if(params!=null){
                    for (int i = 0; i < params.length; i++) {
                       // preparedStatement.setString(1,params[0]);
                        preparedStatement.setObject((i+1), params[i]);

                    }
                    int i = preparedStatement.executeUpdate();
                    if(i>0){
                        // 增删改成功
                        return true;
                    }else{
                        return false;
                    }
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();

            }
            return  false;
        }else{
            System.out.println("连接失败");
            return false;
        }


    }








    /**
     * 根据条件查询对象信息
     *  "SELECT * FROM qq_user WHERE username = ?";
     * @return
     */
    public ResultSet getObjectByParams(String sql,Object[] params){
        ArrayList<User> userList = new ArrayList<>();

        if(this.getConnection()){
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                for (int i = 0; i < params.length; i++) {
                    preparedStatement.setObject((i+1),params[i]);
                }
                return  preparedStatement.executeQuery();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
                return  null;

            }

        }
        else {
            System.out.println("查询过程中，连接数据库失败");
            return  null;
        }
    }

    // 关闭资源
    public boolean closeResource(){
        // 关闭顺序 ：resultSet -> preparedStatement -> connection
        if(resultSet !=null){
            try {
                resultSet.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
                return false;
            }
        }
        if(preparedStatement !=null){
            try {
                preparedStatement.close();

            } catch (SQLException throwables) {
                throwables.printStackTrace();
                return false;
            }
        }
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
                return false;
            }
        }
        return true;
    }


}
