package com.ctgu.service;

import com.ctgu.pojo.Grade;

import java.util.List;

/**
 * @Author : 张华厂
 * @Description :
 * @Date : 10:03 2018/4/24 0024
 */
public interface GradeService {

    /*根据活动名称查找到参与该活动的所有人员*/
    List<Grade> getAllGradeListByName(String a_name);


    /*保存签到信息*/
    void saveGrade(Grade grade);

    /*根据学号查找该用户参加过的活动*/
    List<Grade> getGradeByNum(String s_num);

    /*按时间查找为处理的加分申请*/
    List<Grade> getAllGrade();

    /*根据id查找加分详情*/
    Grade getGrade(int g_id);

    /*根据id更新状态*/
    void updateStatus(int g_id, String g_status);

    /*获取用户签到总分*/
    Double getGradeSign(String s_num);

    /*获取用户参与总分*/
    Double getGradeJoin(String s_num);

    /*获取用户组织总分*/
    Double getGradeOrg(String s_num);

    /*获取用户获奖总分*/
    Double getGradePrize(String s_num);

    /*获取用户获奖总分*/
    Double getGradeSum(String s_num);

    /*根据加分类别查找*/
    List<Grade> getGradeByClass(String g_class, String s_num);
}
