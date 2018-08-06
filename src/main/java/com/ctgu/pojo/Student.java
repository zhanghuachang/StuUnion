package com.ctgu.pojo;

import java.sql.Timestamp;

/**
 * 学生实体
 * @Author : 张华厂
 * @Description :
 * @Date : 13:52 2018/4/14 0014
 */
public class Student {
    private String sid;//学生id
    private String s_name;//姓名
    private String s_num;//学号（用户名）
    private String s_sex;//性别
    private String s_acd;//学院
    private String s_maj;//专业
    private String d_name;//部门名称
    private String p_name;//职位名称
    private String s_birth;//出生日期
    private String s_tel;//电话
    private String s_mail;//邮箱
    private String s_qq;//qq
    private int s_power;//权限 主席1 部长2 干事3
    private Timestamp join_time;//加入时间

    @Override
    public String toString() {
        return "Student{" +
                "sid='" + sid + '\'' +
                ", s_name='" + s_name + '\'' +
                ", s_num='" + s_num + '\'' +
                ", s_sex='" + s_sex + '\'' +
                ", s_acd='" + s_acd + '\'' +
                ", s_maj='" + s_maj + '\'' +
                ", d_name='" + d_name + '\'' +
                ", p_name='" + p_name + '\'' +
                ", s_birth=" + s_birth +
                ", s_tel='" + s_tel + '\'' +
                ", s_mail='" + s_mail + '\'' +
                ", s_qq='" + s_qq + '\'' +
                ", s_power=" + s_power +
                ", join_time=" + join_time +
                '}';
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getS_name() {
        return s_name;
    }

    public void setS_name(String s_name) {
        this.s_name = s_name;
    }

    public String getS_num() {
        return s_num;
    }

    public void setS_num(String s_num) {
        this.s_num = s_num;
    }

    public String getS_sex() {
        return s_sex;
    }

    public void setS_sex(String s_sex) {
        this.s_sex = s_sex;
    }

    public String getS_acd() {
        return s_acd;
    }

    public void setS_acd(String s_acd) {
        this.s_acd = s_acd;
    }

    public String getS_maj() {
        return s_maj;
    }

    public void setS_maj(String s_maj) {
        this.s_maj = s_maj;
    }

    public String getD_name() {
        return d_name;
    }

    public void setD_name(String d_name) {
        this.d_name = d_name;
    }

    public String getP_name() {
        return p_name;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
    }

    public String getS_birth() {
        return s_birth;
    }

    public void setS_birth(String s_birth) {
        this.s_birth = s_birth;
    }

    public String getS_tel() {
        return s_tel;
    }

    public void setS_tel(String s_tel) {
        this.s_tel = s_tel;
    }

    public String getS_mail() {
        return s_mail;
    }

    public void setS_mail(String s_mail) {
        this.s_mail = s_mail;
    }

    public String getS_qq() {
        return s_qq;
    }

    public void setS_qq(String s_qq) {
        this.s_qq = s_qq;
    }

    public int getS_power() {
        return s_power;
    }

    public void setS_power(int s_power) {
        this.s_power = s_power;
    }

    public Timestamp getJoin_time() {
        return join_time;
    }

    public void setJoin_time(Timestamp join_time) {
        this.join_time = join_time;
    }
}