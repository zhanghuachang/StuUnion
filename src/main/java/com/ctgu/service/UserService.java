package com.ctgu.service;


import com.ctgu.pojo.User;

import java.util.List;

/**
 * Created by Zhangxq on 2016/7/15.
 */
public interface UserService {


    User getUserByName(String username);

    User getUserByNumber(String u_number);

    void saveUser(User user);

    void updatePwd(User user);

    //获取所有用户
    List<User> getAllUser();

    //根据学号更新权限
    void updatePower(String u_number, String u_power);

    //根据学号重置密码
    void updatePassword(String u_number, String password);

    /*更新用户信息*/
    void updateUser(User user);
}
