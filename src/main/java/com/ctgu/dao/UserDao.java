package com.ctgu.dao;

import com.ctgu.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Zhangxq on 2016/7/15.
 */

@Repository
public interface UserDao {
    //根据用户名查找用户
    User getUserByName(String username);
    //保存用户
    void saveUser(User user);
    //根据学号查找用户
    User getUserByNumber(String u_number);
    //更新密码
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
