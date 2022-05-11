package com.gxjzy.service;

import com.gxjzy.domain.Menu;
import com.gxjzy.domain.PlUserinfo;

import java.util.List;

//业务逻辑接口
public interface IPlUserinfo {
    //验证登录
    PlUserinfo loginAction(String username);

    //根据用户id动态生成菜单
    List<Menu> selectByUsername(String username);
}
