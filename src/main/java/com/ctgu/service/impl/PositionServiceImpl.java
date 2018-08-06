package com.ctgu.service.impl;

import com.ctgu.dao.PositionDao;
import com.ctgu.pojo.Position;
import com.ctgu.service.PositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author : 张华厂
 * @Description :
 * @Date : 13:58 2018/4/21 0021
 */
@Service
public class PositionServiceImpl implements PositionService{

    @Autowired
    private PositionDao positionDao;

    @Override
    public List<Position> getPositionList() {
        return positionDao.getPositionList();
    }

    @Override
    public void savePosition(Position position) {
        positionDao.savePosition(position);
    }

    @Override
    public void updatePosition(Position position) {
        positionDao.updatePosition(position);
    }

    @Override
    public void deletePosById(int p_id) {
        positionDao.deletePosById(p_id);
    }

    @Override
    public Position getPositionById(int p_id) {
        return positionDao.getPositionById(p_id);
    }
}
