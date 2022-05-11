package com.gxjzy.controller;


import com.alibaba.fastjson.JSONObject;
import com.gxjzy.dao.DetailsMapper;
import com.gxjzy.domain.Details;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Controller
@RequestMapping(value = "/detail")
public class DetailsController {

    @Autowired
    DetailsMapper detailsMapper;

    @RequestMapping("/listAll")
    @ResponseBody
    public List<Details> listAll(){
        List<Details> list = detailsMapper.list();
        return list;
    }

    @RequestMapping(value = "/list")
    @ResponseBody
    public Map<String,Object> list(int page, int limit, String searchParams) throws IOException {


        String where = "where 1=1";
        if(StringUtils.isNotEmpty(searchParams)){
            JSONObject jo = new JSONObject();
            Map<String,String> params = (Map<String,String>)jo.parse(searchParams);
            Set<String> keys=params.keySet();
            for (String key : keys) {
                String keyValue = params.get(key);
                if (StringUtils.isNotEmpty(keyValue)) {
                    where += " and " + key + " like '%" + keyValue + "%'";
                }
            }
        }

        List<Details> list = detailsMapper.getListView((page-1)*limit,limit,where);

        int count = detailsMapper.getListCount(where);

        Map map = new HashMap();
        map.put("code", 0);
        map.put("msg", "成功查询到数据！");
        map.put("count", count);
        map.put("data", list);
        return  map;
    }


    @RequestMapping("/delete")
    @ResponseBody
    public Map delete(String id) {
        int result = detailsMapper.delete(id);
        Map map = new HashMap();
        if (result > 0) {
            map.put("status", 1);
            map.put("msg", "删除成功！");
        }else{
            map.put("status", 0);
            map.put("msg", "删除失败！");
        }
        return map;
    }


    @RequestMapping("/deleteBatch")
    @ResponseBody
    public Map deleteBatch(@RequestBody List<Details> details) {
        int result = detailsMapper.deleteBatch(details);
        Map map = new HashMap();
        if (result > 0) {
            map.put("status", 1);
            map.put("msg", "批量删除成功！");
        }else{
            map.put("status", 0);
            map.put("msg", "批量删除失败！");
        }
        return map;
    }


    @RequestMapping("/update")
    @ResponseBody
    public Map update(@RequestBody Details details) {
        int result = detailsMapper.update(details);
        Map map = new HashMap();
        if (result > 0) {
            map.put("status", 1);
            map.put("msg", "修改成功！");
        }else{
            map.put("status", 0);
            map.put("msg", "修改失败！");
        }
        return map;
    }


    @RequestMapping("/save")
    @ResponseBody
    public Map save(@RequestBody Details details) {
        int result = detailsMapper.save(details);
        Map map = new HashMap();
        if (result > 0) {
            map.put("status", 1);
            map.put("msg", "保存成功！");
        }else{
            map.put("status", 0);
            map.put("msg", "保存失败！");
        }
        return map;
    }
}
