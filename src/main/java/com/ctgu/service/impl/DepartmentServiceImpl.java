package com.ctgu.service.impl;

import com.ctgu.dao.DepartmentDao;
import com.ctgu.pojo.Department;
import com.ctgu.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Author : 张华厂
 * @Description :
 * @Date : 10:23 2018/4/19 0019
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    private DepartmentDao departmentDao;

    @Override
    public List<Department> getDepartmentList() {
        return departmentDao.getDepartmentList();
    }

    @Override
    public void saveDepartment(Department department) {
        departmentDao.saveDepartment(department);
    }

    @Override
    public void updateDepartment(Department department) {
        departmentDao.updateDepartment(department);
    }

    @Override
    public void deleteDepById(int d_id) {
        departmentDao.deleteDepById(d_id);
    }

    @Override
    public Department getDepartmentById(int d_id) {
        return departmentDao.getDepartmentById(d_id);
    }

    @Override
    public Department getDepartmentByName(String d_name) {
        return departmentDao.getDepartmentByName(d_name);
    }
}
