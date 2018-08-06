package com.ctgu.pojo;

import java.sql.Timestamp;

/**
 * 加分实体
 * @Author : 张华厂
 * @Description :
 * @Date : 19:13 2018/4/23 0023
 */
public class Grade {
    private int g_id;
    private String a_name;//活动名称
    private String g_class;//加分类别
    private String g_value;//加分值
    private String s_num;//学生学号
    private String s_name;//学生姓名
    private String s_class;//学生班级
    private Timestamp g_time;//加分时间
    private String g_status;//加分状态
    private String g_decide_name;//审核人
    private String g_prove;//加分证明

    @Override
    public String toString() {
        return "Grade{" +
                "g_id=" + g_id +
                ", a_name='" + a_name + '\'' +
                ", g_class='" + g_class + '\'' +
                ", g_value='" + g_value + '\'' +
                ", s_num='" + s_num + '\'' +
                ", s_name='" + s_name + '\'' +
                ", s_class='" + s_class + '\'' +
                ", g_time=" + g_time +
                ", g_status=" + g_status +
                ", g_decide_name='" + g_decide_name + '\'' +
                ", g_prove='" + g_prove + '\'' +
                '}';
    }

    public int getG_id() {
        return g_id;
    }

    public void setG_id(int g_id) {
        this.g_id = g_id;
    }

    public String getA_name() {
        return a_name;
    }

    public void setA_name(String a_name) {
        this.a_name = a_name;
    }

    public String getG_class() {
        return g_class;
    }

    public void setG_class(String g_class) {
        this.g_class = g_class;
    }

    public String getG_value() {
        return g_value;
    }

    public void setG_value(String g_value) {
        this.g_value = g_value;
    }

    public String getS_num() {
        return s_num;
    }

    public void setS_num(String s_num) {
        this.s_num = s_num;
    }

    public String getS_name() {
        return s_name;
    }

    public void setS_name(String s_name) {
        this.s_name = s_name;
    }

    public String getS_class() {
        return s_class;
    }

    public void setS_class(String s_class) {
        this.s_class = s_class;
    }

    public Timestamp getG_time() {
        return g_time;
    }

    public void setG_time(Timestamp g_time) {
        this.g_time = g_time;
    }

    public String getG_status() {
        return g_status;
    }

    public void setG_status(String g_status) {
        this.g_status = g_status;
    }

    public String getG_decide_name() {
        return g_decide_name;
    }

    public void setG_decide_name(String g_decide_name) {
        this.g_decide_name = g_decide_name;
    }

    public String getG_prove() {
        return g_prove;
    }

    public void setG_prove(String g_prove) {
        this.g_prove = g_prove;
    }
}
