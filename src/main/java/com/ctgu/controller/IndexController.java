package com.ctgu.controller;

import com.ctgu.pojo.Student;
import com.ctgu.pojo.User;
import com.ctgu.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * 首页
 * @Author : 张华厂
 * @Description :
 * @Date : 14:44 2018/4/17 0017
 */
@Controller
public class IndexController {


    @Autowired
    private StudentService studentService;

    /*登陆界面*/
    @RequestMapping("/")
    public String loginPage(){
        return "login";
    }

    /**
     * 注册界面
     * @return
     */
    @RequestMapping("/registerPage")
    public String registerPage(){

        return "register";
    }

    /*管理系统后台首页*/
    @RequestMapping("/admin")
    public ModelAndView index(HttpSession session){
        User user = (User)session.getAttribute("user");
        Student student = studentService.studentInfo(user.getU_number());
        ModelAndView mv = new ModelAndView();
        mv.addObject("user", user);
        mv.addObject("student",student);
        mv.setViewName("index");
        return mv;
    }

    @RequestMapping("/map")
    public String map(){
        return "map";
    }


    @RequestMapping("/logout")
    public String logOut(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }

    @RequestMapping("/tab")
    public String tabPage(){
        return "tab";
    }

    @RequestMapping("/message")
    public String message(){
        return "message";
    }
}
