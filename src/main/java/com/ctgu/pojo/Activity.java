package com.ctgu.pojo;


import java.sql.Timestamp;

/**
 * 活动实体
 * @Author : 张华厂
 * @Description :
 * @Date : 17:48 2018/4/16 0016
 */
public class Activity {
    private int a_id;
    private String a_name; //活动名称
    private String a_class; //活动类型
    private String d_name;//承办部门
    private String a_describe;//活动简述
    private String a_time;//活动时间
    private String a_place;//活动地点
    private Timestamp application_time;//申请时间
    private String a_status;//活动状态   拒绝，同意，未审批
    private String a_apply_name;//申请人姓名
    private String a_decide_name;//处理人姓名
    private String a_url;//策划书路径

    @Override
    public String toString() {
        return "Activity{" +
                "a_id=" + a_id +
                ", a_name='" + a_name + '\'' +
                ", a_class='" + a_class + '\'' +
                ", d_name='" + d_name + '\'' +
                ", a_describe='" + a_describe + '\'' +
                ", a_time='" + a_time + '\'' +
                ", a_place='" + a_place + '\'' +
                ", application_time=" + application_time +
                ", a_status='" + a_status + '\'' +
                ", a_apply_name='" + a_apply_name + '\'' +
                ", a_decide_name='" + a_decide_name + '\'' +
                ", a_url='" + a_url + '\'' +
                '}';
    }

    public int getA_id() {
        return a_id;
    }

    public void setA_id(int a_id) {
        this.a_id = a_id;
    }

    public String getA_name() {
        return a_name;
    }

    public void setA_name(String a_name) {
        this.a_name = a_name;
    }

    public String getA_class() {
        return a_class;
    }

    public void setA_class(String a_class) {
        this.a_class = a_class;
    }

    public String getD_name() {
        return d_name;
    }

    public void setD_name(String d_name) {
        this.d_name = d_name;
    }

    public String getA_describe() {
        return a_describe;
    }

    public void setA_describe(String a_describe) {
        this.a_describe = a_describe;
    }

    public String getA_time() {
        return a_time;
    }

    public void setA_time(String a_time) {
        this.a_time = a_time;
    }

    public String getA_place() {
        return a_place;
    }

    public void setA_place(String a_place) {
        this.a_place = a_place;
    }

    public Timestamp getApplication_time() {
        return application_time;
    }

    public void setApplication_time(Timestamp application_time) {
        this.application_time = application_time;
    }

    public String getA_status() {
        return a_status;
    }

    public void setA_status(String a_status) {
        this.a_status = a_status;
    }

    public String getA_apply_name() {
        return a_apply_name;
    }

    public void setA_apply_name(String a_apply_name) {
        this.a_apply_name = a_apply_name;
    }

    public String getA_decide_name() {
        return a_decide_name;
    }

    public void setA_decide_name(String a_decide_name) {
        this.a_decide_name = a_decide_name;
    }

    public String getA_url() {
        return a_url;
    }

    public void setA_url(String a_url) {
        this.a_url = a_url;
    }
}




