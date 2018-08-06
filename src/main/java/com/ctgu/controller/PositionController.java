package com.ctgu.controller;

import com.ctgu.pojo.Position;
import com.ctgu.pojo.Position;
import com.ctgu.service.PositionService;
import com.google.gson.Gson;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Author : 张华厂
 * @Description :
 * @Date : 14:02 2018/4/21 0021
 */
@Controller
@RequestMapping("position")
public class PositionController {

    private Logger log = Logger.getLogger(PositionController.class);

    @Autowired
    private PositionService positionService;

    /**
     * 职位管理界面
     * @return
     */
    @RequestMapping("/manage")
    public String posManage(){
        log.info("职位管理界面");
        return "positionManage";
    }

    /**
     * 获取所有职位信息
     * 过滤掉html标签
     * @return
     */
    @RequestMapping("/getPositionList")
    @ResponseBody
    public String getPositionList(){
        log.info("获取职位所有信息");
        List<Position> list = positionService.getPositionList();

        Gson gson = new Gson();
        String getPositionList = gson.toJson(list);
        return getPositionList;
    }

    /**
     * 根据id删除职位
     * @param p_id
     * @return
     */
    @RequestMapping("/deletePosition")
    @ResponseBody
    public boolean deletePosition(@RequestParam("p_id") String p_id){
        log.info("删除id为" + p_id + "的职位");
        positionService.deletePosById(Integer.valueOf(p_id));
        return true;
    }

    /**
     * 插入职位
     * @param position
     * @return
     */
    @RequestMapping("/savePosition")
    @ResponseBody
    public boolean savePosition(Position position){
        log.info("插入职位信息" + position);
        positionService.savePosition(position);
        return true;
    }

    /**
     * 根据id查找职位
     * @param p_id
     * @return
     */

    @RequestMapping("/getPositionById")
    @ResponseBody
    public String getPositionById(@RequestParam("p_id") String p_id){
        log.info("查找id为" + p_id + "的职位信息");
        Position Position = positionService.getPositionById(Integer.valueOf(p_id));
        Gson gson = new Gson();
        String PositionJson = gson.toJson(Position);
        return PositionJson;
    }
    /**
     * 更新职位信息
     * @param position
     * @return
     */
    @RequestMapping("/updatePosition")
    @ResponseBody
    public boolean updateposition(Position position){
        log.info("更新id为" + position.getP_id() + "的职位信息");
        log.info(position);
        positionService.updatePosition(position);
        return true;
    }
}
