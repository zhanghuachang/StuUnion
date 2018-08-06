package com.ctgu.service.impl;

import com.ctgu.dao.ActivitySignDao;
import com.ctgu.pojo.ActivitySign;
import com.ctgu.service.ActivitySignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author : 张华厂
 * @Description :
 * @Date : 19:37 2018/4/24 0024
 */
@Service
public class ActivitySignServiceImpl implements ActivitySignService {

    @Autowired
    private ActivitySignDao activitySignDao;

    @Override
    public void saveActivitySign(ActivitySign activitySign) {
        activitySignDao.saveActivitySign(activitySign);
    }

    @Override
    public List<ActivitySign> gerActivitySignList(String a_name) {
        return activitySignDao.gerActivitySignList(a_name);
    }
}
