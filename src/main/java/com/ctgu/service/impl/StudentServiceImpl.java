package com.ctgu.service.impl;

import com.ctgu.dao.StudentDao;
import com.ctgu.pojo.Student;
import com.ctgu.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Author : 张华厂
 * @Description :
 * @Date : 14:18 2018/4/14 0014
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentDao studentDao;

    public List<Student> getStudentList() {
        return studentDao.getStudentList();
    }

    public void saveStudent(Student student) {
        studentDao.saveStudent(student);
    }

    public void updateStudent(Student student) {
        studentDao.updateStudent(student);
    }

    public List<Student> powerStudentList(int s_power) {
        return studentDao.powerStudentList(s_power);
    }

    public Student studentInfo(String s_num) {
        return studentDao.studentInfo(s_num);
    }

    public void deleteStudent(int sid) {
        studentDao.deleteStudent(sid);
    }

    @Override
    public void updateDep(Student student) {
        studentDao.updateDep(student);
    }

    @Override
    public List<Student> getPeoStudent() {
        return studentDao.getPeoStudent();
    }

    @Override
    public List<Student> getStudentByDep(String d_name) {
        return studentDao.getStudentByDep(d_name);
    }

    @Override
    public void updatePowerByNum(String s_num, String s_power) {
        studentDao.updatePowerByNum(s_num, s_power);
    }
}
