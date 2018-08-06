package com.ctgu.pojo;

/**
 * 部门实体
 * @Author : 张华厂
 * @Description :
 * @Date : 17:10 2018/4/16 0016
 */
public class Department {
    private int d_id;
    private String d_name; //部门名称
    private String d_describe;//部门描述

    @Override
    public String toString() {
        return "Department{" +
                "d_id=" + d_id +
                ", d_name='" + d_name + '\'' +
                ", d_describe='" + d_describe + '\'' +
                '}';
    }

    public int getD_id() {
        return d_id;
    }

    public void setD_id(int d_id) {
        this.d_id = d_id;
    }

    public String getD_name() {
        return d_name;
    }

    public void setD_name(String d_name) {
        this.d_name = d_name;
    }

    public String getD_describe() {
        return d_describe;
    }

    public void setD_describe(String d_describe) {
        this.d_describe = d_describe;
    }
}


