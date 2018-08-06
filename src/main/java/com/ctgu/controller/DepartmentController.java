package com.ctgu.controller;

import com.ctgu.pojo.Department;
import com.ctgu.pojo.Student;
import com.ctgu.pojo.User;
import com.ctgu.service.DepartmentService;
import com.ctgu.service.StudentService;
import com.google.gson.Gson;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @Author : 张华厂
 * @Description :
 * @Date : 10:04 2018/4/19 0019
 */
@Controller
@RequestMapping("department")
public class DepartmentController {
    private Logger log = Logger.getLogger(DepartmentController.class);

    @Autowired
    private DepartmentService departmentService;

    @Autowired
    private StudentService studentService;

    /**
     *  部门管理界面
     * @return
     */
    @RequestMapping("/manage")
    public ModelAndView depManage(HttpSession session){
        User user = (User)session.getAttribute("user");
        Student student = studentService.studentInfo(user.getU_number());
        ModelAndView mv = new ModelAndView();
        mv.addObject("student", student);
        mv.setViewName("depManage");
        return mv;
    }

    @RequestMapping("/introduce")
    public ModelAndView depIntroduce(){
        ModelAndView mv = new ModelAndView();
        List<Department> departmentList = departmentService.getDepartmentList();
        mv.addObject("departmentList", departmentList);
        mv.setViewName("dep_introduce");
        return mv;
    }


    /**
     * 获取所有部门信息
     * 过滤掉html标签
     * @return
     */
    @RequestMapping("/getDepartmentList")
    @ResponseBody
    public String getDepartmentList(){
        log.info("获取部门所有信息");
        List<Department> list = departmentService.getDepartmentList();

        for (Department department : list){
            String htmlStr = department.getD_describe();
            String regEx_script = "<script[^>]*?>[\\s\\S]*?<\\/script>"; //定义script的正则表达式
            String regEx_style = "<style[^>]*?>[\\s\\S]*?<\\/style>"; //定义style的正则表达式
            String regEx_html = "<[^>]+>"; //定义HTML标签的正则表达式
            Pattern p_script = Pattern.compile(regEx_script, Pattern.CASE_INSENSITIVE);
            Matcher m_script = p_script.matcher(htmlStr);
            htmlStr = m_script.replaceAll(""); //过滤script标签

            Pattern p_style = Pattern.compile(regEx_style, Pattern.CASE_INSENSITIVE);
            Matcher m_style = p_style.matcher(htmlStr);
            htmlStr = m_style.replaceAll(""); //过滤style标签

            Pattern p_html = Pattern.compile(regEx_html, Pattern.CASE_INSENSITIVE);
            Matcher m_html = p_html.matcher(htmlStr);
            htmlStr = m_html.replaceAll(""); //过滤html标签
            department.setD_describe(htmlStr); //返回文本字符串
        }

        Gson gson = new Gson();
        String getDepartmentList = gson.toJson(list);
        return getDepartmentList;
    }

    /**
     * 根据id删除部门
     * @param d_id
     */
    @RequestMapping("/deleteDepartment")
    @ResponseBody
    public boolean deleteDepartment(@RequestParam("d_id") String d_id){
        log.info("删除id为" + d_id + "的部门");
        departmentService.deleteDepById(Integer.valueOf(d_id));
        return true;
    }

    /**
     * 插入部门
     * @param department
     * @return
     */
    @RequestMapping("/saveDepartment")
    @ResponseBody
    public boolean saveDepartment(Department department){
        log.info("保存部门信息" + department);
        departmentService.saveDepartment(department);
        return true;
    }

    /**
     * 根据id查找部门
     * @param d_id
     * @return
     */

    @RequestMapping("/getDepartmentById")
    @ResponseBody
    public String getDepartmentById(@RequestParam("d_id") String d_id){
        log.info("查找id为" + d_id + "的部门信息");
        Department department = departmentService.getDepartmentById(Integer.valueOf(d_id));
        Gson gson = new Gson();
        String departmentJson = gson.toJson(department);
        return departmentJson;
    }

    /**
     * 更新部门信息
     * @param department
     * @return
     */
    @RequestMapping("/updateDepartment")
    @ResponseBody
    public boolean updateDepartment(Department department){
        log.info("更新id为" + department.getD_id() + "的部门信息");
        log.info(department);
        departmentService.updateDepartment(department);
        return true;
    }

    @RequestMapping("/getDepartmentByName")
    @ResponseBody
    public String getDepartmentByName(@RequestParam("d_name") String d_name){
        log.info("查找" + d_name + "的信息");
        Department department = departmentService.getDepartmentByName(d_name);
        Gson gson = new Gson();
        String departmentStr = gson.toJson(department);
        return departmentStr;
    }
}
