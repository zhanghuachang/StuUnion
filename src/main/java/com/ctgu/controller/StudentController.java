package com.ctgu.controller;

import com.ctgu.pojo.Department;
import com.ctgu.pojo.Student;
import com.ctgu.pojo.User;
import com.ctgu.service.DepartmentService;
import com.ctgu.service.SignService;
import com.ctgu.service.StudentService;
import com.ctgu.service.UserService;
import com.google.gson.Gson;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.jws.WebParam;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @Author : 张华厂
 * @Description :
 * @Date : 14:35 2018/4/14 0014
 */
@Controller
@RequestMapping("/student")
public class StudentController {

    private Logger log = Logger.getLogger(StudentController.class);

    @Autowired
    private StudentService studentService;

    @Autowired
    private UserService userService;

    @Autowired
    private SignService signService;

    @Autowired
    private DepartmentService departmentService;
    /*
    * 获取所有学生信息
    * */
    @RequestMapping("/getStudentList")
    public ModelAndView AllStudent(){
        log.info("获取所有学生信息");
        List<Student> studentList = studentService.getStudentList();
        ModelAndView mv = new ModelAndView();
        mv.addObject("studentList", studentList);
        mv.setViewName("showStudent");
        return mv;
    }

    /**
     * 保存学生信息
     * @param student
     * @return
     */
    @RequestMapping("/saveStudent")
    @ResponseBody
    public boolean saveStudent(Student student){
        log.info("保存学生信息");
        log.info(student);
        studentService.saveStudent(student);
        return true;
    }

    /**
     * 更新学生信息
     * @param student
     * @return
     */
    @RequestMapping("/updateInfo")
    @ResponseBody
    public boolean updateInfo(Student student){
        log.info("更新学生信息");
        log.info(student);
        studentService.updateStudent(student);
        return true;
    }

    /**
     * 通过学号查找信息
     * @param s_num
     * @return
     */
    @RequestMapping("/getStudentByNum")
    @ResponseBody
    public String getStudentByNum(@RequestParam("s_num") String s_num){
        log.info("查找学号为" + s_num + "的信息");
        Student student = studentService.studentInfo(s_num);
        Gson gson = new Gson();
        String studentStr = gson.toJson(student);
        return  studentStr;
    }

    /**
     * 在职人员管理界面
     */
    @RequestMapping("/studentManage")
    public ModelAndView studentManage(HttpSession session){
        log.info("在职人员管理界面");
        ModelAndView mv = new ModelAndView();
        List<Department> departmentList = departmentService.getDepartmentList();
        User user = (User)session.getAttribute("user");
        mv.addObject("departmentList", departmentList);
        mv.addObject("user", user);
        mv.setViewName("student_manage");
        return mv;
    }

    /**
     * 分配部门
     * @param student
     * @return
     */
    @RequestMapping("/updateDep")
    @ResponseBody
    public boolean updateDep(Student student){
        log.info(student);
        studentService.updateDep(student);
        userService.updatePower(student.getS_num(), "3");
        /*已处理的报名信息*/
        signService.updateStatus("1", student.getS_num());
        return true;
    }

    /**
     * 在职人员名单
     */
    @RequestMapping("/getPeoStudent")
    @ResponseBody
    public String getPeoStudent(){
        log.info("在职人员名单获取");
        List<Student> list = studentService.getPeoStudent();
        log.info(list);
        Gson gson = new Gson();
        String peoStudent = gson.toJson(list);
        return peoStudent;
    }

    @RequestMapping("/getStudentByDep")
    @ResponseBody
    public String getStudentByDep(@RequestParam("d_name") String d_name){
        log.info("查找部门为" + d_name);
        List<Student> list = studentService.getStudentByDep(d_name);
        log.info(list);
        Gson gson = new Gson();
        String studentList = gson.toJson(list);
        return studentList;
    }


    /**
     * 删除在职人员
     */

    @RequestMapping("/deletePeo")
    @ResponseBody
    public boolean deletePeo(Student student){
        studentService.updateDep(student);
        userService.updatePower(student.getS_num(), "4");
        studentService.updatePowerByNum(student.getS_num(), "4");
        return true;
    }
}
