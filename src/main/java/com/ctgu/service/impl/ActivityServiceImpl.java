package com.ctgu.service.impl;

import com.ctgu.dao.ActivityDao;
import com.ctgu.pojo.Activity;
import com.ctgu.service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author : 张华厂
 * @Description :
 * @Date : 18:20 2018/4/23 0023
 */
@Service
public class ActivityServiceImpl implements ActivityService {
    @Autowired
    private ActivityDao activityDao;

    @Override
    public List<Activity> getAllActivityList() {
        return activityDao.getAllActivityList();
    }

    @Override
    public void saveActivity(Activity activity) {
        activityDao.saveActivity(activity);
    }

    @Override
    public List<Activity> getActivityList() {
        return activityDao.getActivityList();
    }

    @Override
    public void updateStatus(int a_id, String a_status) {
        activityDao.updateStatus(a_id, a_status);
    }

    @Override
    public Activity getActivity(int a_id) {
        return activityDao.getActivity(a_id);
    }

    @Override
    public List<Activity> searchActivity(String start_time, String end_time) {
        return activityDao.searchActivity(start_time, end_time);
    }
}
