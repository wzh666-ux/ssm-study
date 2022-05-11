package com.gxjzy.controller;

import com.alibaba.fastjson.JSONObject;
import com.gxjzy.dao.PlPlantinfoMapper;
import com.gxjzy.domain.PlPlantinfo;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http .HttpServletRequest;
import java.io.File;
import java.util.*;

@Controller
@RequestMapping("/plantinfo")
public class PlPlantinfoController {

    @Autowired
    PlPlantinfoMapper plPlantinfoMapper;

    //查询所有植物给下拉选择使用
    @RequestMapping("/listAll")
    @ResponseBody
    public List<PlPlantinfo> listAll(){
        List<PlPlantinfo> list = plPlantinfoMapper.list();
        return list;
    }

    @RequestMapping("/listAllAPP")
    @ResponseBody
    public List<Map<String, String>> listAllAPP(){
        List<PlPlantinfo> list = plPlantinfoMapper.list();
        List<Map<String,String>> listAPP=new ArrayList<>();
        for (PlPlantinfo plPlantinfo : list){
            Map map=new HashMap();
            map.put("img",plPlantinfo.getImagepath());
            map.put("title",plPlantinfo.getPlantname());
            map.put("littleTitle",plPlantinfo.getAddtime());
            map.put("id",plPlantinfo.getId());
            map.put("morchar",plPlantinfo.getMorchar());
            map.put("username",plPlantinfo.getUsername());
            listAPP.add(map);
        }
        return listAPP;
    }

    //分页查询
    @RequestMapping("/list")
    @ResponseBody
    public Map<String,Object> listView(int page,int limit,String searchParams){   //查询科类列表并返回
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
        List<PlPlantinfo> list = plPlantinfoMapper.getListView((page-1)*limit,limit,where);
        //List<PlPlantinfo> list = plPlantinfoMapper.list();
        //获取数据的总条数
        int count = plPlantinfoMapper.getListCount(where);
        Map map = new HashMap();
        map.put("code", 0);
        map.put("msg", "成功查询到数据！");
        map.put("count", count);  //数据的总条数
        map.put("data", list);
        return map;
    }

    //根据id查询植物信息
    @RequestMapping("/detail")
    @ResponseBody
    public PlPlantinfo detail(String id) {
        PlPlantinfo plPlantinfo = plPlantinfoMapper.detail(id);
        return plPlantinfo;
    }

    //删除科类信息
    @RequestMapping("/delete")
    @ResponseBody
    public Map delete(String id) {
        int result = plPlantinfoMapper.delete(id);  //调用删除接口
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
    public Map deleteBatch(@RequestBody List<PlPlantinfo> plCategories) {
        int result = plPlantinfoMapper.deleteBatch(plCategories);  //调用批量删除接口
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
    public Map update(@RequestBody PlPlantinfo plPlantinfo) {
        //设置修改时间
        plPlantinfo.setModtime(DateFormatUtils.format(new Date(),"yyyy-MM-dd HH:mm:ss")); //修改时为当前时间
        int result = plPlantinfoMapper.update(plPlantinfo);  //调用修改接口
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

    @RequestMapping("/changeState")
    @ResponseBody
    public Map changeState(String id, boolean isstate) {
        int result = plPlantinfoMapper.changeState(id,isstate);  //调用修改接口
        Map map = new HashMap();
        if (result > 0) {
            map.put("status", 1); //成功状态
            map.put("msg", "修改状态成功！");
        }else{
            map.put("status", 0); //失败状态
            map.put("msg", "修改状态失败！");
        }
        return map;
    }

    //保存科类信息
    @RequestMapping("/save")
    @ResponseBody
    public Map save(@RequestBody PlPlantinfo plPlantinfo,HttpServletRequest request) {

        //设置发布人，发布时间，发布状态
        plPlantinfo.setAddtime(DateFormatUtils.format(new Date(),"yyyy-MM-dd HH:mm:ss")); //发布时为当前时间
        plPlantinfo.setIsstate(true); //默认发布
        plPlantinfo.setUsername((String)request.getSession().getAttribute("username"));

        int result;
        try{
            result = plPlantinfoMapper.save(plPlantinfo);//调用保存接口
        }catch (Exception e){
            result = -1;
        }
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

    //上传文件到服务器
    @RequestMapping("/upload")
    @ResponseBody
    public Map upload(@RequestParam MultipartFile file, HttpServletRequest request){  //MultipartFile 上传文件对象
        String path = request.getServletContext().getRealPath("/upload"); //获取上传文件路径的地址/upload
        //设置文件名规范：当前年月日时分秒
        String fileName = DateFormatUtils.format(new Date(), "yyyyMMddHHmmss");
        //获取原始文件名,不包含后缀名
        String name = FilenameUtils.removeExtension(file.getOriginalFilename());
        //获取原始文件名的后缀
        String prefix = FilenameUtils.getExtension(file.getOriginalFilename());
        //定义保存到服务器的文件
        File targetFile = new File(path, fileName + name + "." + prefix);
        try {
            file.transferTo(targetFile); //将文件上传到目的服务器
        } catch (Exception e) {
            e.printStackTrace();
        }
        //将上传文件的路径返回给前台页面，后续存到数据库
        Map map = new HashMap();
        map.put("code", 0);
        map.put("msg", "成功上传图片");
        map.put("data","/upload/"+fileName + name + "." + prefix); //上传文件所在的路径
        return map;
    }

}
