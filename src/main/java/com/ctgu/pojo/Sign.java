package com.ctgu.pojo;

/**报名实体
 * @Author : 张华厂
 * @Description :
 * @Date : 21:08 2018/4/29 0029
 */
public class Sign {
    private int sig_id;
    private String sig_name;  //姓名
    private String sig_num;//学号
    private String sig_sex;//性别
    private String s_birth;//生日
    private String sig_tel;//电话
    private String sig_email;//邮箱
    private String sig_first_department;//第一志愿
    private String sig_second_department;//第二志愿
    private String sig_talent;//特长
    private String sig_reason;//加入理由
    private String sig_nation;//民族
    private String sig_adjust;//是否服从调剂
    private String sig_picture;//照片路径
    private String sig_status;//是否分配部门

    @Override
    public String toString() {
        return "Sign{" +
                "sig_id=" + sig_id +
                ", sig_name='" + sig_name + '\'' +
                ", sig_num='" + sig_num + '\'' +
                ", sig_sex='" + sig_sex + '\'' +
                ", s_birth='" + s_birth + '\'' +
                ", sig_tel='" + sig_tel + '\'' +
                ", sig_email='" + sig_email + '\'' +
                ", sig_first_department='" + sig_first_department + '\'' +
                ", sig_second_department='" + sig_second_department + '\'' +
                ", sig_talent='" + sig_talent + '\'' +
                ", sig_reason='" + sig_reason + '\'' +
                ", sig_nation='" + sig_nation + '\'' +
                ", sig_adjust='" + sig_adjust + '\'' +
                ", sig_picture='" + sig_picture + '\'' +
                ", sig_status='" + sig_status + '\'' +
                '}';
    }

    public int getSig_id() {
        return sig_id;
    }

    public void setSig_id(int sig_id) {
        this.sig_id = sig_id;
    }

    public String getSig_name() {
        return sig_name;
    }

    public void setSig_name(String sig_name) {
        this.sig_name = sig_name;
    }

    public String getSig_num() {
        return sig_num;
    }

    public void setSig_num(String sig_num) {
        this.sig_num = sig_num;
    }

    public String getSig_sex() {
        return sig_sex;
    }

    public void setSig_sex(String sig_sex) {
        this.sig_sex = sig_sex;
    }

    public String getS_birth() {
        return s_birth;
    }

    public void setS_birth(String s_birth) {
        this.s_birth = s_birth;
    }

    public String getSig_tel() {
        return sig_tel;
    }

    public void setSig_tel(String sig_tel) {
        this.sig_tel = sig_tel;
    }

    public String getSig_email() {
        return sig_email;
    }

    public void setSig_email(String sig_email) {
        this.sig_email = sig_email;
    }

    public String getSig_first_department() {
        return sig_first_department;
    }

    public void setSig_first_department(String sig_first_department) {
        this.sig_first_department = sig_first_department;
    }

    public String getSig_second_department() {
        return sig_second_department;
    }

    public void setSig_second_department(String sig_second_department) {
        this.sig_second_department = sig_second_department;
    }

    public String getSig_talent() {
        return sig_talent;
    }

    public void setSig_talent(String sig_talent) {
        this.sig_talent = sig_talent;
    }

    public String getSig_reason() {
        return sig_reason;
    }

    public void setSig_reason(String sig_reason) {
        this.sig_reason = sig_reason;
    }

    public String getSig_nation() {
        return sig_nation;
    }

    public void setSig_nation(String sig_nation) {
        this.sig_nation = sig_nation;
    }

    public String getSig_adjust() {
        return sig_adjust;
    }

    public void setSig_adjust(String sig_adjust) {
        this.sig_adjust = sig_adjust;
    }

    public String getSig_picture() {
        return sig_picture;
    }

    public void setSig_picture(String sig_picture) {
        this.sig_picture = sig_picture;
    }

    public String getSig_status() {
        return sig_status;
    }

    public void setSig_status(String sig_status) {
        this.sig_status = sig_status;
    }
}
