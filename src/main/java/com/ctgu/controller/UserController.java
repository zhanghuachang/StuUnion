package com.ctgu.controller;

import com.ctgu.pojo.Student;
import com.ctgu.pojo.User;
import com.ctgu.service.StudentService;
import com.ctgu.service.UserService;
import com.google.gson.Gson;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("user")
public class UserController {

    private Logger log = Logger.getLogger(UserController.class);
    @Resource
    private UserService userService;

    @Resource
    private StudentService studentService;


    /**
     * 判断用户名是否存在
     */
    @RequestMapping("/checkUsername")
    @ResponseBody
    public boolean checkUserName(@RequestParam("username") String username){
        User user = userService.getUserByName(username);
        if(user != null)
            return true;
        else
            return false;
    }

    /**
     * 判断学号是否注册
     */
    @RequestMapping("/checkNumber")
    @ResponseBody
    public boolean checkNumber(@RequestParam("u_number") String u_number){
        User user = userService.getUserByNumber(u_number);
        if(user != null)
            return true;
        else
            return false;
    }

    /**
     * 用户注册
     */

    @RequestMapping("/register")
    public String register(User user){
        log.info("用户注册");
        userService.saveUser(user);
        return "redirect:/";
    }

    /**
     * 检测用户名和密码
     */
    @RequestMapping("/loginCheck")
    @ResponseBody
    public boolean checkLogin(@RequestParam("username") String username,
                              @RequestParam("password") String password){
        log.info("匹配用户名和密码");
        log.info("用户名：" + username + " "+"密码：" + password);
        User user = userService.getUserByName(username);
        if(user.getPassword().equals(password))
            return true;
        else
            return false;
    }

    /**
     * 用户登陆成功
     */
    @RequestMapping("/login")
    public String login(@RequestParam("username") String username,
                        HttpSession session){
        User user = new User();
        user = userService.getUserByName(username);
        session.setAttribute("user", user);
        return "redirect:/admin";
    }

    /**
     * 用户的个人信息界面
     */
    @RequestMapping("/userInfo")
    public ModelAndView userInfoPage(HttpSession session){
        ModelAndView mv = new ModelAndView();
        User user = (User)session.getAttribute("user");
        Student student = studentService.studentInfo(user.getU_number());
        session.setAttribute("student", student);
        mv.addObject("user",user);
        mv.addObject("student",student);
        mv.setViewName("userInfo");
        return mv;
    }

    /*修改密码界面*/
    @RequestMapping("/changPwdPage")
    public ModelAndView changPwdPage(HttpSession session){
        User user = (User)session.getAttribute("user");
        ModelAndView mv = new ModelAndView();
        mv.addObject("user", user);
        mv.setViewName("change_pwd");
        return mv;
    }

    /**
     * 修改密码
     * @param password
     * @param session
     * @return
     */
    @RequestMapping("/changePwd")
    @ResponseBody
    public boolean updatePwd(@RequestParam("password") String password, HttpSession session){
        log.info("将密码修改为" + password);
        User user = (User)session.getAttribute("user");
        user.setPassword(password);
        userService.updatePwd(user);
        return true;
    }

    /*用戶管理界面*/
    @RequestMapping("/userManage")
    public ModelAndView userManagePage(HttpSession session){
        ModelAndView mv = new ModelAndView();
        User user = (User)session.getAttribute("user");
        mv.addObject("user", user);
        mv.setViewName("user_manage");
        return mv;
    }

    /**
     * 获取所有用户信息
     * @return
     */
    @RequestMapping("/getAllUser")
    @ResponseBody
    public String getAllUser(){
        log.info("获取所有用户信息");
        List<User> list = userService.getAllUser();
        Gson gson = new Gson();
        String userList = gson.toJson(list);
        return userList;
    }

    /**
     * 根据学号修改权限
     * @param u_number
     * @param u_power
     * @return
     */
    @RequestMapping("/updatePower")
    @ResponseBody
    public boolean updatePower(@RequestParam("u_number") String u_number,
                               @RequestParam("u_power") String u_power){
        log.info("将学号为" + u_number + "的用户权限更改为" + u_power);
        userService.updatePower(u_number, u_power);
        return true;
    }

    @RequestMapping("/updatePwd")
    @ResponseBody
    public boolean updatePwd(@RequestParam("u_number") String u_number,
                             @RequestParam("password") String password){
        log.info("将学号为" + u_number + "的用户密码更改为" + password);
        userService.updatePassword(u_number, password);
        return true;
    }

    /**
     * 根据学号查找用户
     * @param u_number
     * @return
     */
    @RequestMapping("/getUserByNum")
    @ResponseBody
    public String getUserByNum(@RequestParam("u_number") String u_number){
        log.info("查找学号为" + u_number + "的用户信息");
        User user = userService.getUserByNumber(u_number);
        Gson gson = new Gson();
        String userStr = gson.toJson(user);
        return userStr;
    }

    @RequestMapping("/updateUser")
    @ResponseBody
    public String updateUser(User user){
        log.info("更新用户信息" + user);
        userService.updateUser(user);
        User user1 = userService.getUserByNumber(user.getU_number());
        Gson gson = new Gson();
        String userStr = gson.toJson(user1);
        return userStr;
    }
}
