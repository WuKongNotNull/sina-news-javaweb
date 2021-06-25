package com.wukong.service.user;/*
author: 悟空非空也（B站/知乎/公众号） 
*/

import com.wukong.dao.user.UserDao;
import com.wukong.dao.user.UserDaoImpl;
import com.wukong.pojo.User;


public class UserServiceImpl  implements UserService{

    private UserDao userDao =new UserDaoImpl();


    /**
     * 注册用户
     * @param user
     * @return
     */
    public boolean addUser(User user) {
        return userDao.addUser(user);
    }

    /**
     * 进行用户名唯一验证
     * @param username  用户名
     * @return  true/false  1 唯一存在 0 不存在
     *
     */
    public boolean isExistUsername(String username) {
        int count = userDao.verifyOnlyUsername(username);
        return count == 1;
    }



    /**
     * 根据用户名和密码验证用户
     * @param username  客户端传过来的username
     * @param password  客户端传过来的password
     * @return user
     */
    public User getUserByUsernameAndPassword(String username,String password){
        User userByUsername = userDao.getUserByUsername(username);
        if (userByUsername != null) {
            if (userByUsername.getPassword().equals(password)) {
                // 用户名和密码在数据库中都存在，验证身份合法
                return userByUsername;
            }
        }
        return  null;
    }


    /**
     * 根据用户id 获得用户信息
     *
     * @param id 用户id
     * @return 返回用户对象
     */
    @Override
    public User getUserById(Integer id) {
       return this.userDao.getUserById(id);
    }

}
