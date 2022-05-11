package com.gxjzy.controller;

import com.gxjzy.dao.PlUserinfoMapper;
import com.gxjzy.domain.Menu;
import com.gxjzy.domain.PlUserinfo;
import com.gxjzy.service.IPlUserinfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/Login")
public class LoginController {

    @Autowired //获取服务层接口
    IPlUserinfo iPlUserinfo;
    @Autowired
    PlUserinfoMapper plUserinfoMapper;

    @RequestMapping(value = {"/out"})
    public String doLogin(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
        session.removeAttribute("username");
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                    System.out.println(cookie.getValue());
                    cookie.setMaxAge(0);
                    cookie.setPath("/");
                    response.addCookie(cookie);
                }
            }
        }
        response.sendRedirect("/plant/login.jsp");
        return null;
    }

    @RequestMapping("/login")  //登录验证
    @ResponseBody
    public Map<String, Object> login(HttpSession session, HttpServletResponse response,
                                     String username, String password, String keepLogin) {
        Map<String, Object> map = new HashMap<>();
        //调用服务层实现登录信息查询
        PlUserinfo plUserinfo = iPlUserinfo.loginAction(username);
        if (plUserinfo != null) {
            //验证密码是否正确
            if (plUserinfo.getPassword().equals(password)) {
                //登录成功，把登录用户名存储到session回话中，前台可以从会话中获取
                session.setAttribute("username", plUserinfo.getUsername());
                //如果勾选了保持登录，把用户名存储到cookie中
                if ("1".equals(keepLogin)) {
                    Cookie cookie = new Cookie("username",plUserinfo.getUsername());
                    cookie.setPath("/"); //cookie的路径
                    cookie.setMaxAge(3600*24); //cookie的有效期 单位秒
                    response.addCookie(cookie);
                }
                map.put("status", 1); //成功状态
                map.put("msg", "登录成功！");
            }else{
                map.put("status", 0); //失败状态
                map.put("msg", "用户密码错误！");
            }
        }else{
            map.put("status", 0); //失败状态
            map.put("msg", "用户不存在！");
        }
        return map;
    }

    /**
     * 注册 1、判断注册的用户名是否重复 2、把新用户和密码插入用户表
     * @param request
     * @return
     */
    @RequestMapping("/reg")  //注册验证
    @ResponseBody
    public Map<String, Object> reg(HttpSession session, HttpServletResponse response,
                                     String username, String password, String keepLogin) {
        //1、判断注册的用户名是否重复
        Map<String, Object> map = new HashMap<>();
        //调用服务层实现登录信息查询
        PlUserinfo plUserinfo = iPlUserinfo.loginAction(username);
        if (plUserinfo != null) {
            map.put("status", 0); //失败状态
            map.put("msg", "用户已存在！");
        }else {
            //2、把新用户和密码插入用户表
            PlUserinfo plUserinfonew=new PlUserinfo();
            plUserinfonew.setUsername(username);
            plUserinfonew.setPassword(password);
            int result=plUserinfoMapper.save(plUserinfonew);
            if (result>0){
                map.put("status", 1); //成功状态
                map.put("msg", "注册成功！");
            }else {
                map.put("status", 0); //成功状态
                map.put("msg", "注册失败！");
            }

        }

        return map;
    }

    /**
     * 修改密码
     * @param request
     * @return
     */
    @RequestMapping("/forget")  //注册验证
    @ResponseBody
    public Map<String, Object> forget(HttpSession session, HttpServletResponse response,
                                   String username, String password, String keepLogin,String password2) {

        //1、判断注册的用户名是否重复
        Map<String, Object> map = new HashMap<>();
        //调用服务层实现登录信息查询
        PlUserinfo plUserinfo = iPlUserinfo.loginAction(username);
        if (plUserinfo!=null){
            if (plUserinfo.getPassword().equals(password)) {
                //2、把新密码插入用户表
                plUserinfo.setPassword(password2);
                int result=plUserinfoMapper.forget(plUserinfo);
                if (result>0){
                    map.put("status", 1); //成功状态
                    map.put("msg", "密码修改成功！");
                }else {
                    map.put("status", 0); //成功状态
                    map.put("msg", "密码修改失败！");
                }

            }else {
                map.put("status", 0); //失败状态
                map.put("msg", "密码修改失败！");

            }
        }else {
            map.put("status", 0); //失败状态
            map.put("msg", "用户不存在！");

        }
        return map;
    }



    //动态生成菜单接口
    @RequestMapping("/menu")
    @ResponseBody
    public Map menu(HttpServletRequest request){
        //生成菜单，格式参考api/init.json
        Map menuMap = new HashMap();
        Map homeInfo = new HashMap();
        homeInfo.put("title", "首页");
        homeInfo.put("href", "plant/welcome.jsp");
        Map logoInfo = new HashMap();
        logoInfo.put("title", "绿色车间管理");
        logoInfo.put("image", "images/head.png");
        logoInfo.put("href", "");
        menuMap.put("homeInfo", homeInfo);
        menuMap.put("logoInfo", logoInfo);
        //从数据库生成基础管理和植物信息
        List<Menu> menuInfo = new ArrayList<>();
        List<Menu> menuInfoList = iPlUserinfo.selectByUsername((String)request.getSession().getAttribute("username"));  //根据登录用查询菜单
        Menu jcgl=new Menu(1,1,"基础管理","","fa fa-address-book","_self",menuInfoList);
        menuInfo.add(jcgl);
        menuMap.put("menuInfo", menuInfo);  //加入菜单到主菜单里
        return menuMap;
    }

    @RequestMapping("/getUser")
    @ResponseBody
    public String getUser(HttpSession session) {
        String username=(String) session.getAttribute("username");
        return username;
    }


}
