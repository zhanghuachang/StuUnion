package com.ctgu.dao;

import com.ctgu.pojo.Student;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Author : 张华厂
 * @Description :
 * @Date : 14:13 2018/4/14 0014
 */
@Repository
public interface StudentDao {
    //获取所有用户信息
    List<Student> getStudentList();

    //保存学生信息
    void saveStudent(Student student);

    //更新学生信息
    void updateStudent(Student student);

    //根据自身权限查看低权限学生的信息
    List<Student> powerStudentList(int s_power);

    //根据学号查找学生信息
    Student studentInfo(String s_num);

    //根据id删除学生信息
    void deleteStudent(int sid);

    //根据学号更新部门和职位
    void updateDep(Student student);

    //在职人员名单获取
    List<Student> getPeoStudent();

    //根据部门查找在职人员
    List<Student> getStudentByDep(String d_name);

    //根据学号修改权限
    void updatePowerByNum(String s_num, String s_power);
}
