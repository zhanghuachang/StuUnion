package com.ctgu.controller;

import com.ctgu.pojo.Activity;
import com.ctgu.pojo.Department;
import com.ctgu.pojo.Student;
import com.ctgu.pojo.User;
import com.ctgu.service.ActivityService;
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
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @Author : 张华厂
 * @Description :
 * @Date : 10:36 2018/4/23 0023
 */
@Controller
@RequestMapping("/activity")
public class ActivityController {

    private Logger log = Logger.getLogger(ActivityController.class);

    @Autowired
    private ActivityService activityService;

    @Autowired
    private StudentService studentService;


    @RequestMapping("/manage")
    public String manageIndex(){
        return "activity_manage";
    }

    /**
     * 活动申请界面
     */
    @RequestMapping("/application")
    public ModelAndView applicationPage(HttpSession session){
        ModelAndView mv = new ModelAndView();
        User user = (User)session.getAttribute("user");
        Student student = studentService.studentInfo(user.getU_number());
        mv.addObject("student", student);
        mv.setViewName("activity_application");
        return mv;
    }

    /**
     * 活动列表界面
     */
    @RequestMapping("/activityListPage")
    public String activityListPage(){
        return "activity_list";
    }

    /**
     * 按时间顺序获取所有活动
     * @return
     */
    @RequestMapping("/getAllActivity")
    @ResponseBody
    public String getAllActivity(){
        log.info("按时间顺序获取所有活动");
        List<Activity> list = activityService.getAllActivityList();

        for (Activity activity : list){
            /*过滤文本标签*/
            String htmlStr = activity.getA_describe();
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
            activity.setA_describe(htmlStr); //返回文本字符串

            /*转换时间格式*/

        }

        Gson gson = new Gson();
        String allActivityList = gson.toJson(list);
        return allActivityList;
    }


    /**
     * 获取获取已经举办过的所有活动
     * @return
     */
    @RequestMapping("/activityList")
    @ResponseBody
    public String activityList(){
        log.info("获取已经举办过的所有活动");
        List<Activity> list = activityService.getActivityList();
        Gson gson = new Gson();
        String activityList = gson.toJson(list);
        return activityList;
    }

    @RequestMapping("/saveActivity")
    @ResponseBody
    public boolean saveActivity(Activity activity){
        log.info("保存活动信息--" + activity);
        activityService.saveActivity(activity);
        return true;
    }

    /**
     * 根据a_id更新活动状态
     * @param a_id
     * @param a_status
     * @return
     */
    @RequestMapping("/updateStatus")
    @ResponseBody
    public boolean updateStatus(@RequestParam("a_id") String a_id,
                                @RequestParam("a_status") String a_status){
        log.info("将id为" + a_id + "的状态更新为" + a_status);
        activityService.updateStatus(Integer.valueOf(a_id), a_status);
        return true;
    }

    /**
     * 根据id获取活动信息
     * @param a_id
     * @return
     */
    @RequestMapping("/getActivity")
    @ResponseBody
    public String getActivity(@RequestParam("a_id") String a_id){
        log.info("获取id为" + a_id + "的活动信息");
        Activity activity = activityService.getActivity(Integer.valueOf(a_id));
        log.info(activity);
        Gson gson = new Gson();
        String strActivity = gson.toJson(activity);
        return strActivity;
    }

    /**
     * 个人活动通知界面
     */
    @RequestMapping("/activityNoticeList")
    public ModelAndView activityNoticePage(HttpSession session){
        ModelAndView mv = new ModelAndView();
        User user = (User)session.getAttribute("user");
        Student student = studentService.studentInfo(user.getU_number());
        mv.addObject("student", student);
        mv.setViewName("activity_notice");
        log.info("个人活动通知页面");
        return mv;
    }

    /**
     * 按时间查找活动
     */
    @RequestMapping("/searchTime")
    @ResponseBody
    public String searchTime(@RequestParam("start_time") String start_time,
                             @RequestParam("end_time") String end_time){
        List<Activity> list = activityService.searchActivity(start_time, end_time);
        Gson gson = new Gson();
        String activityList = gson.toJson(list);
        return activityList;
    }
}
