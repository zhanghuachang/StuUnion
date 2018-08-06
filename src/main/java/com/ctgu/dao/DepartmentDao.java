package com.ctgu.dao;

import com.ctgu.pojo.Department;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Author : 张华厂
 * @Description :
 * @Date : 14:03 2018/4/18 0018
 */
@Repository
public interface DepartmentDao {
    /*获取所有部门*/
    List<Department> getDepartmentList();

    /*插入部门*/
    void saveDepartment(Department department);

    /*更新部门*/
    void updateDepartment(Department department);

    /*删除部门*/
    void deleteDepById(int d_id);

    /*查找部门*/
    Department getDepartmentById(int d_id);

    /*根据部门名称查找部门*/
    Department getDepartmentByName(String d_name);
}
