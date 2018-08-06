package com.ctgu.controller;

import com.ctgu.pojo.Activity;
import com.ctgu.pojo.Grade;
import com.ctgu.pojo.Student;
import com.ctgu.pojo.User;
import com.ctgu.service.ActivityService;
import com.ctgu.service.GradeService;
import com.ctgu.service.StudentService;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @Author : 张华厂
 * @Description :
 * @Date : 10:05 2018/4/24 0024
 */
@Controller
@RequestMapping("/grade")
public class GradeController {

    private Logger log = Logger.getLogger(GradeController.class);

    @Autowired
    private GradeService gradeService;

    @Autowired
    private ActivityService activityService;

    @Autowired
    private StudentService studentService;

    Gson gson = new Gson();

    /**
     * 查找参加该活动的所有人员
     * @param a_id
     * @return
     */
    @RequestMapping("/getAllGradeListById")
    @ResponseBody
    public String getAllGradeListById(@RequestParam("a_id") String a_id){
        log.info("查找参加该活动的所有人员");
        Activity activity = activityService.getActivity(Integer.valueOf(a_id));
        List<Grade> list = gradeService.getAllGradeListByName(activity.getA_name());
        String gradeList = gson.toJson(list);
        return gradeList;
    }

    /**
     * 申请某项活动加分页面
     */
    @RequestMapping("/applicationPage")
    public ModelAndView applicationPage(HttpSession session){
        User user = (User)session.getAttribute("user");
        Student student = studentService.studentInfo(user.getU_number());
        ModelAndView mv = new ModelAndView();
        mv.addObject("student", student);
        mv.setViewName("grade_application");
        return mv;
    }


    /**
     * 加分申请保存
     * @param grade
     * @return
     */
    @RequestMapping("/saveGrade")
    @ResponseBody
    public boolean saveGrade(Grade grade){
        log.info("加分申请" + grade);
        gradeService.saveGrade(grade);
        return true;
    }


    /*加分记录页面*/
    @RequestMapping("/grade_recordPage")
    public String recordPage(){
        return "grade_record";
    }

    /**
     * 通过学号查找已加分的活动
     * @param session
     * @return
     */
    @RequestMapping("/getGradeByNum")
    @ResponseBody
    public String getGradeByNum(HttpSession session){
        User user = (User)session.getAttribute("user");
        log.info("查找学号为" + user.getU_number() + "参加过的活动");
        List<Grade> list = gradeService.getGradeByNum(user.getU_number());
        String gradeList = gson.toJson(list);
        return gradeList;
    }

    /**
     * 签到页面
     * @param a_name
     * @param req
     * @return
     */
    @RequestMapping("/SignInPage")
    public String signInPage(@RequestParam("a_name") String a_name, HttpServletRequest req){
        req.getSession().setAttribute("a_name", a_name);
        return "attendance";
    }

    /*加分审批页面*/
    @RequestMapping("/grade_manage")
    public String gradeManagePage(){
        return "grade_manage";
    }

    /**
     * 按时间获取所有加分申请
     * @return
     */
    @RequestMapping("/getAllGrade")
    @ResponseBody
    public String getAllGrade(){
        log.info("按时间获取所有加分申请");
        List<Grade> list = gradeService.getAllGrade();
        String allGrade = gson.toJson(list);
        return allGrade;
    }

    /**
     * 根据ID查找加分明细
     * @param g_id
     * @return
     */
    @RequestMapping("/getGrade")
    @ResponseBody
    public String getGrade(@RequestParam("g_id") String g_id){
        log.info("查找id为" + g_id + "的加分明细");
        Grade grade = gradeService.getGrade(Integer.valueOf(g_id));
        String gradeStr = gson.toJson(grade);
        return gradeStr;
    }

    /**
     * 根据a_id更新活动状态
     * @param g_id
     * @param g_status
     * @return
     */
    @RequestMapping("/updateStatus")
    @ResponseBody
    public boolean updateStatus(@RequestParam("g_id") String g_id,
                                @RequestParam("g_status") String g_status){
        log.info("将id为" + g_id + "的状态更新为" + g_status);
        gradeService.updateStatus(Integer.valueOf(g_id), g_status);
        return true;
    }

    /**
     * 各类分数总结
     */
    @RequestMapping("/getAllPrize")
    @ResponseBody
    public String getAllPrize(HttpSession session){
        log.info("各类分数总结");
        User user = (User)session.getAttribute("user");
        Double gra_sign = gradeService.getGradeSign(user.getU_number());
        Double gra_join = gradeService.getGradeJoin(user.getU_number());
        Double gra_ora = gradeService.getGradeOrg(user.getU_number());
        Double gra_prize = gradeService.getGradePrize(user.getU_number());
        Double gra_sum = gradeService.getGradeSum(user.getU_number());
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("gra_sign", gra_sign);
        jsonObject.addProperty("gra_join", gra_join);
        jsonObject.addProperty("gra_ora", gra_ora);
        jsonObject.addProperty("gra_prize", gra_prize);
        jsonObject.addProperty("gra_sum", gra_sum);
        Gson gson = new Gson();
        String data = gson.toJson(jsonObject);
        log.info(jsonObject);
        return data;
    }

    /**
     * 根据加分类别查找
     * @param g_class
     * @param session
     * @return
     */
    @RequestMapping("/getGradeByClass")
    @ResponseBody
    public String getGradeByClass(@RequestParam("g_class") String g_class,
                                  HttpSession session){
        log.info("查找" + g_class + "的加分详情");
        User user = (User)session.getAttribute("user");
        List<Grade> list = gradeService.getGradeByClass(g_class, user.getU_number());
        Gson gson = new Gson();
        String gradeList = gson.toJson(list);
        return gradeList;
    }
}
