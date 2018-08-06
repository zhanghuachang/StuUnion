package com.ctgu.service;

import com.ctgu.pojo.ActivitySign;

import java.util.List;

/**
 * @Author : 张华厂
 * @Description :
 * @Date : 19:36 2018/4/24 0024
 */
public interface ActivitySignService {

    /*保存学生报名信息*/
    void saveActivitySign(ActivitySign activitySign);

    /*获取某活动的报名情况*/
    List<ActivitySign> gerActivitySignList(String a_name);

}
