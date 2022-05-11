package com.gxjzy.dao;


import com.gxjzy.domain.DeviceWei;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DeviceWeiMapper {

    //查询植物科类的数据列表
    List<DeviceWei> list();
    //分页和搜索查询植物科类的数据列表
    List<DeviceWei> getListView(int page,int limit,String where);

    //查询植物科类数据的总条数
    int getListCount(@Param("where") String where);

    //根据id删除科类信息
    int delete(String id);

    //根据id修改科类信息
    int update(DeviceWei deviceWei);

    //添加科类信息
    int save(DeviceWei deviceWei);

    //批量删除科类信息,接收PlCategory列表
    int deleteBatch(@Param("plDeviceWei") List<DeviceWei> deviceWeis);
}
