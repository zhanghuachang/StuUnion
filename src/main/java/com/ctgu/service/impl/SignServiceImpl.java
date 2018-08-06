package com.ctgu.service.impl;

import com.ctgu.dao.SignDao;
import com.ctgu.pojo.Sign;
import com.ctgu.service.SignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author : 张华厂
 * @Description :
 * @Date : 21:21 2018/4/29 0029
 */
@Service
public class SignServiceImpl implements SignService {

    @Autowired
    private SignDao signDao;

    @Override
    public void saveSign(Sign sign) {
        signDao.saveSign(sign);
    }

    @Override
    public Sign getSignByNum(String sig_num) {
        return signDao.getSignByNum(sig_num);
    }

    @Override
    public List<Sign> getAllSign() {
        return signDao.getAllSign();
    }

    @Override
    public void updateSign(Sign sign) {
        signDao.updateSign(sign);
    }

    @Override
    public void updateStatus(String sig_status, String sig_num) {
        signDao.updateStatus(sig_status, sig_num);
    }

    @Override
    public List<Sign> getSignByDep(String d_name) {
        return signDao.getSignByDep(d_name);
    }
}
