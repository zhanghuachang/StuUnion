package com.ctgu.controller;

import com.ctgu.pojo.Activity;
import com.ctgu.pojo.ActivitySign;
import com.ctgu.service.ActivityService;
import com.ctgu.service.ActivitySignService;
import com.google.gson.Gson;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Author : 张华厂
 * @Description :
 * @Date : 19:38 2018/4/24 0024
 */
@Controller
@RequestMapping("activitySign")
public class ActivitySignController {

    private Logger log = Logger.getLogger(ActivitySignController.class);

    @Autowired
    private ActivitySignService activitySignService;

    @Autowired
    private ActivityService activityService;

    /**
     * 保存报名信息
     * @param activitySign
     * @return
     */
    @RequestMapping("/saveActivitySign")
    @ResponseBody
    public boolean saveActivitySign(ActivitySign activitySign, @RequestParam("a_id") String a_id){
        log.info("保存报名信息");
        Activity activity = activityService.getActivity(Integer.valueOf(a_id));
        activitySign.setA_name(activity.getA_name());
        log.info(activitySign);
        activitySignService.saveActivitySign(activitySign);
        return true;
    }


    @RequestMapping("/getActivitySign")
    @ResponseBody
    public String getActivitySign(@RequestParam("a_id") String a_id){
        Activity activity = activityService.getActivity(Integer.valueOf(a_id));
        log.info("获取 " + activity.getA_name() + " 的报名信息");
        List<ActivitySign> list = activitySignService.gerActivitySignList(activity.getA_name());
        Gson gson = new Gson();
        String activitySignList = gson.toJson(list);
        return activitySignList;
    }
}
