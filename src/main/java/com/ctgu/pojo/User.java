package com.ctgu.pojo;


import java.sql.Timestamp;

/**
 * 用户实体
 * @Author : zhc
 * @Description :
 * @Date : 21:02 2018/4/8 0008
 */
public class User {
    private int uid;
    private String username; //用户名
    private String password; //密码
    private String u_number; //学号
    private String salt; //MD5加密
    private Timestamp register_time;//注册时间
    private String u_mail;//邮箱
    private int u_power;//权限

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", u_number='" + u_number + '\'' +
                ", salt='" + salt + '\'' +
                ", register_time=" + register_time +
                ", u_mail='" + u_mail + '\'' +
                ", u_power=" + u_power +
                '}';
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getU_number() {
        return u_number;
    }

    public void setU_number(String u_number) {
        this.u_number = u_number;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public Timestamp getRegister_time() {
        return register_time;
    }

    public void setRegister_time(Timestamp register_time) {
        this.register_time = register_time;
    }

    public String getU_mail() {
        return u_mail;
    }

    public void setU_mail(String u_mail) {
        this.u_mail = u_mail;
    }

    public int getU_power() {
        return u_power;
    }

    public void setU_power(int u_power) {
        this.u_power = u_power;
    }
}

