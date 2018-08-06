package com.ctgu.service.impl;

import com.ctgu.dao.GradeDao;
import com.ctgu.pojo.Grade;
import com.ctgu.service.GradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author : 张华厂
 * @Description :
 * @Date : 10:03 2018/4/24 0024
 */
@Service
public class GradeServiceImpl implements GradeService {

    @Autowired
    private GradeDao gradeDao;

    @Override
    public List<Grade> getAllGradeListByName(String a_name) {
        return gradeDao.getAllGradeListByName(a_name);
    }

    @Override
    public void saveGrade(Grade grade) {
        gradeDao.saveGrade(grade);
    }

    @Override
    public List<Grade> getGradeByNum(String s_num) {
        return gradeDao.getGradeByNum(s_num);
    }

    @Override
    public List<Grade> getAllGrade() {
        return gradeDao.getAllGrade();
    }

    @Override
    public Grade getGrade(int g_id) {
        return gradeDao.getGrade(g_id);
    }

    @Override
    public void updateStatus(int g_id, String g_status) {
        gradeDao.updateStatus(g_id, g_status);
    }

    @Override
    public Double getGradeSign(String s_num) {
        return gradeDao.getGradeSign(s_num);
    }

    @Override
    public Double getGradeJoin(String s_num) {
        return gradeDao.getGradeJoin(s_num);
    }

    @Override
    public Double getGradeOrg(String s_num) {
        return gradeDao.getGradeOrg(s_num);
    }

    @Override
    public Double getGradePrize(String s_num) {
        return gradeDao.getGradePrize(s_num);
    }

    @Override
    public Double getGradeSum(String s_num) {
        return gradeDao.getGradeSum(s_num);
    }

    @Override
    public List<Grade> getGradeByClass(String g_class, String s_num) {
        return gradeDao.getGradeByClass(g_class, s_num);
    }
}
