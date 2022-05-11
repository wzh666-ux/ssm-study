package com.gxjzy.service.impl;

import com.gxjzy.dao.PlUserinfoMapper;
import com.gxjzy.domain.Menu;
import com.gxjzy.domain.PlUserinfo;
import com.gxjzy.service.IPlUserinfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service  //注解表示服务层
public class PlUserinfoService implements IPlUserinfo {

    @Autowired  //获取数据访问层
    PlUserinfoMapper plUserinfoMapper;

    @Override
    public PlUserinfo loginAction(String username) {
        //编写登录的业务处理逻辑
        //调用数据访问接口plUserinfoMapper查询登录用户信息并返回
        PlUserinfo plUserinfo = plUserinfoMapper.loginAction(username);
        return plUserinfo;
    }

    @Override
    public List<Menu> selectByUsername(String username) {
        List<Menu> menuList = plUserinfoMapper.selectByUsername(username);
        //所有父菜单
        List<Menu> root = new ArrayList<>();
        for (Menu menu : menuList) {
            if (menu.getPid() == -1) {  //pid为-1的是最外层菜单
                root.add(menu);
            }
        }
        //拼子菜单
        for (Menu menu : root) {
            //递归遍历所有child菜单
            List<Menu> childList = getChildMenu(menu.getId(), menuList);
            menu.setChild(childList); //设置子菜单
        }
        return root;  //返回所有菜单
    }
    //递归遍历所有child菜单
    public List<Menu> getChildMenu(int id, List<Menu> allMenu) {
        List<Menu> childList = new ArrayList<>();
        for (Menu menu : allMenu) {
            if (menu.getPid() == id) {  //所有的子菜单
                childList.add(menu);
            }
        }
        for (Menu menu : childList) {
            menu.setChild(getChildMenu(menu.getId(),allMenu)); //产生递归
        }
        if (childList != null && childList.size() == 0) {
            return null;
        }
        return childList;
    }
}
