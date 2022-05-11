package com.gxjzy.dao;

import com.gxjzy.domain.Menu;
import com.gxjzy.domain.PlUserinfo;
import com.gxjzy.domain.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PlUserinfoMapper {
    //验证登录接口
    PlUserinfo loginAction(String username);

    //查询用户对应的菜单
    List<Menu> selectByUsername(String username);

    //插入
    int save(PlUserinfo plUserinfo);

    //修改密码
    int forget(PlUserinfo plUserinfo);



    //查询植物科类的数据列表
    List<PlUserinfo> list();

    //分页和搜索查询植物科类的数据列表
    List<PlUserinfo> getListView(int page, int limit, String where);

    //查询植物科类数据的总条数
    int getListCount(@Param("where") String where);

    //根据id删除科类信息
    int delete(String id);

    //根据id修改科类信息
    int update(PlUserinfo plUserinfo);

    //添加科类信息
    int insert(PlUserinfo plUserinfo);

    //批量删除科类信息,接收PlCategory列表
    int deleteBatch(@Param("plUserinfo") List<PlUserinfo> plUserinfos);

    //获取角色列表
    List<Role> role();

}
