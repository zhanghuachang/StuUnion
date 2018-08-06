package com.ctgu.controller;

import com.ctgu.pojo.Department;
import com.ctgu.pojo.Sign;
import com.ctgu.pojo.Student;
import com.ctgu.pojo.User;
import com.ctgu.service.DepartmentService;
import com.ctgu.service.SignService;
import com.ctgu.service.StudentService;
import com.google.gson.Gson;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @Author : 张华厂
 * @Description :
 * @Date : 21:40 2018/4/29 0029
 */
@Controller
@RequestMapping("/sign")
public class SignController {

    private Logger log = Logger.getLogger(SignController.class);

    @Autowired
    private SignService signService;

    @Autowired
    private DepartmentService departmentService;

    @Autowired
    private StudentService studentService;

    @RequestMapping("/signPage")
    public ModelAndView signPage(HttpSession session){
        ModelAndView mv = new ModelAndView();
        User user = (User)session.getAttribute("user");
        Sign sign = signService.getSignByNum(user.getU_number());
        log.info("当前用户的报名信息" + sign);
        Student student = studentService.studentInfo(user.getU_number());
        mv.addObject("sign", sign);
        mv.addObject("student",student);
        mv.setViewName("recruitApply");
        /*所有部门*/
        List<Department> departmentList = departmentService.getDepartmentList();
        mv.addObject("departmentList", departmentList);
        return mv;
    }


    /*保存报名信息*/
    @RequestMapping("/saveSign")
    @ResponseBody
    public boolean saveSign(Sign sign){
        log.info("保存报名信息" + sign);
        signService.saveSign(sign);
        return true;
    }

    /*更新报名信息*/
    @RequestMapping("/updateSign")
    @ResponseBody
    public boolean updateSign(Sign sign){
        log.info("更新报名信息" + sign);
        signService.updateSign(sign);
        return true;
    }

    /*报名信息管理*/
    @RequestMapping("/signManage")
    public ModelAndView signManage(){
        log.info("报名信息管理页面");
        ModelAndView mv = new ModelAndView();
        /*所有部门*/
        List<Department> departmentList = departmentService.getDepartmentList();
        mv.addObject("departmentList", departmentList);
        mv.setViewName("sign_manage");
        return mv;
    }

    @RequestMapping("/getAllSign")
    @ResponseBody
    public String getAllSign(){
        List<Sign> list = signService.getAllSign();
        Gson gson = new Gson();
        String signList = gson.toJson(list);
        return signList;
    }

    /**
     * 根据学号查找报名信息
     * @param sig_num
     * @return
     */
    @RequestMapping("/getSignByNum")
    @ResponseBody
    public String getSignByNum(@RequestParam("sig_num") String sig_num){
        Sign sign = signService.getSignByNum(sig_num);
        log.info("查找" + sign);
        Gson gson = new Gson();
        String signStr = gson.toJson(sign);
        return signStr;
    }

    /**
     * 根据第一志愿部门名称查找报名人员信息
     */
    @RequestMapping("/getSignByDep")
    @ResponseBody
    public String getSignByDep(@RequestParam("d_name") String d_name){
        log.info("查找报" + d_name + "的所有人信息");
        List<Sign> list = signService.getSignByDep(d_name);
        Gson gson = new Gson();
        String signList = gson.toJson(list);
        return signList;
    }
}
