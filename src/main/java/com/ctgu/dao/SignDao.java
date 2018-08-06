package com.ctgu.dao;

import com.ctgu.pojo.Sign;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Author : 张华厂
 * @Description :
 * @Date : 21:14 2018/4/29 0029
 */
@Repository
public interface SignDao {

    /*保存报名信息*/
    void saveSign(Sign sign);

    /*根据学号查找报名信息*/
    Sign getSignByNum(String sig_num);

    /*查找所有报名信息*/
    List<Sign> getAllSign();

    /*更新报名信息*/
    void updateSign(Sign sign);

    /*根据学号修改录取状态*/
    void updateStatus(String sig_status, String sig_num);

    /*根据第一志愿部门名称查找报名信息*/
    List<Sign> getSignByDep(String d_name);
}
