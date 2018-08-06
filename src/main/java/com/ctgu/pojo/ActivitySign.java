package com.ctgu.pojo;

import java.sql.Timestamp;

/**
 * 活动报名表实体
 * @Author : 张华厂
 * @Description :
 * @Date : 19:22 2018/4/24 0024
 */
public class ActivitySign {
    private int as_id;
    private String a_name;//活动名称
    private String s_name;//学生姓名
    private String s_num;//学生学号
    private String s_sex;//学生性别
    private String s_acd;//学院
    private String s_class;//班级
    private String s_tel;//手机号
    private String s_mail;//邮箱
    private Timestamp as_time;//报名时间

    @Override
    public String toString() {
        return "ActivitySign{" +
                "as_id=" + as_id +
                ", a_name='" + a_name + '\'' +
                ", s_name='" + s_name + '\'' +
                ", s_num='" + s_num + '\'' +
                ", s_sex='" + s_sex + '\'' +
                ", s_acd='" + s_acd + '\'' +
                ", s_class='" + s_class + '\'' +
                ", s_tel='" + s_tel + '\'' +
                ", s_mail='" + s_mail + '\'' +
                ", as_time=" + as_time +
                '}';
    }

    public int getAs_id() {
        return as_id;
    }

    public void setAs_id(int as_id) {
        this.as_id = as_id;
    }

    public String getA_name() {
        return a_name;
    }

    public void setA_name(String a_name) {
        this.a_name = a_name;
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

    public String getS_class() {
        return s_class;
    }

    public void setS_class(String s_class) {
        this.s_class = s_class;
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

    public Timestamp getAs_time() {
        return as_time;
    }

    public void setAs_time(Timestamp as_time) {
        this.as_time = as_time;
    }
}
