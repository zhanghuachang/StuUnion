package com.ctgu.service.impl;

import com.ctgu.dao.UserDao;
import com.ctgu.pojo.User;
import com.ctgu.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class UserServiceImpl implements UserService  {

    @Resource
    private UserDao userDao;

    public User getUserByName(String username) {
        return userDao.getUserByName(username);
    }

    public User getUserByNumber(String u_number) {
        return userDao.getUserByNumber(u_number);
    }

    public void saveUser(User user) {
        userDao.saveUser(user);
    }

    public void updatePwd(User user) {
        userDao.updatePwd(user);
    }

    @Override
    public List<User> getAllUser() {
        return userDao.getAllUser();
    }

    @Override
    public void updatePower(String u_number, String u_power) {
        userDao.updatePower(u_number, u_power);
    }

    @Override
    public void updatePassword(String u_number, String password) {
        userDao.updatePassword(u_number, password);
    }

    @Override
    public void updateUser(User user) {
        userDao.updateUser(user);
    }
}