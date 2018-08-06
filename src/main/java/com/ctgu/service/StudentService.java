package com.ctgu.service;

import com.ctgu.pojo.Student;

import java.util.List;

/**
 * @Author : 张华厂
 * @Description :
 * @Date : 14:18 2018/4/14 0014
 */
public interface StudentService {
    List<Student> getStudentList();

    void saveStudent(Student student);

    void updateStudent(Student student);

    void deleteStudent(int sid);

    List<Student> powerStudentList(int s_power);

    Student studentInfo(String s_num);

    //根据学号更新部门和职位
    void updateDep(Student student);

    //在职人员名单获取
    List<Student> getPeoStudent();

    //根据部门查找在职人员
    List<Student> getStudentByDep(String d_name);

    //根据学号修改权限
    void updatePowerByNum(String s_num, String s_power);
}
