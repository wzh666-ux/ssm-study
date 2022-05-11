package com.gxjzy.controller;


import com.alibaba.fastjson.JSONObject;
import com.gxjzy.dao.DeviceTypeMapper;
import com.gxjzy.domain.DeviceType;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Controller
@RequestMapping("/devicetype")
public class DeviceTypeController {

    @Autowired
    DeviceTypeMapper deviceTypeMapper;

    //查询所有科类给下拉选择使用
    @RequestMapping("/listAll")
    @ResponseBody
    public List<DeviceType> listAll(){
        List<DeviceType> list = deviceTypeMapper.list();
        return list;
    }

    //分页查询
    @RequestMapping("/list")
    @ResponseBody
    public Map<String,Object> listView(int page, int limit, String searchParams){   //查询科类列表并返回
        //{"cyno":"99","cyname":"雨"} searchParams :搜索的参数
        //page:  当前页码    limit： 每页的条数
        System.out.println("当前页码："+page+ " 每页的条数:"+limit+" 搜索的参数:"+searchParams);
        //实现分页查询和搜索功能
        String where = "where 1=1";
        if(StringUtils.isNotEmpty(searchParams)){
            JSONObject jo = new JSONObject();
            Map<String,String> params = (Map<String,String>)jo.parse(searchParams);
            Set<String> keys=params.keySet(); // 获取搜索参数里所有字段
            for (String key : keys) {
                String keyValue = params.get(key);
                if (StringUtils.isNotEmpty(keyValue)) { //如果搜索参数值不为空则加入到where条件
                    where += " and " + key + " like '%" + keyValue + "%'";   //拼搜索条件，模糊查询
                }
            }
        }
        //调用分页查询
        List<DeviceType> list = deviceTypeMapper.getListView((page-1)*limit,limit,where);
        //List<PlCategory> list = plCategoryMapper.list();
        //获取数据的总条数
        int count = deviceTypeMapper.getListCount(where);
        Map map = new HashMap();
        map.put("code", 0);
        map.put("msg", "成功查询到数据！");
        map.put("count", count);  //数据的总条数
        map.put("data", list);
        return map;
    }

    //删除科类信息
    @RequestMapping("/delete")
    @ResponseBody
    public Map delete(String id) {
        int result = deviceTypeMapper.delete(id);  //调用删除接口
        Map map = new HashMap();
        if (result > 0) {
            map.put("status", 1); //成功状态
            map.put("msg", "删除成功！");
        }else{
            map.put("status", 0); //失败状态
            map.put("msg", "删除失败！");
        }
        return map;
    }

    //批量删除科类信息
    @RequestMapping("/deleteBatch")
    @ResponseBody
    public Map deleteBatch(@RequestBody List<DeviceType> deviceTypes) {
        int result = deviceTypeMapper.deleteBatch(deviceTypes);  //调用批量删除接口
        Map map = new HashMap();
        if (result > 0) {
            map.put("status", 1); //成功状态
            map.put("msg", "批量删除成功！");
        }else{
            map.put("status", 0); //失败状态
            map.put("msg", "批量删除失败！");
        }
        return map;
    }

    //修改科类信息
    @RequestMapping("/update")
    @ResponseBody
    public Map update(@RequestBody DeviceType deviceType) {
        int result = deviceTypeMapper.update(deviceType);  //调用修改接口
        Map map = new HashMap();
        if (result > 0) {
            map.put("status", 1); //成功状态
            map.put("msg", "修改成功！");
        }else{
            map.put("status", 0); //失败状态
            map.put("msg", "修改失败！");
        }
        return map;
    }

    //保存科类信息
    @RequestMapping("/save")
    @ResponseBody
    public Map save(@RequestBody DeviceType deviceType) {
        int result = deviceTypeMapper.save(deviceType);//调用保存接口
        Map map = new HashMap();
        if (result > 0) {
            map.put("status", 1); //成功状态
            map.put("msg", "保存成功！");
        }else{
            map.put("status", 0); //失败状态
            map.put("msg", "保存失败！");
        }
        return map;
    }
}
