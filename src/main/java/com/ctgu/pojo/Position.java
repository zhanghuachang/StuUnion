package com.ctgu.pojo;

/**
 *
 * 职位实体
 * @Author : 张华厂
 * @Description :
 * @Date : 17:07 2018/4/16 0016
 */
public class Position {
    private int p_id;
    private String p_name;//职位名称


    @Override
    public String toString() {
        return "Position{" +
                "p_id=" + p_id +
                ", p_name='" + p_name + '\'' +
                '}';
    }

    public int getP_id() {
        return p_id;
    }

    public void setP_id(int p_id) {
        this.p_id = p_id;
    }

    public String getP_name() {
        return p_name;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
    }
}
