package com.gxjzy.dao;

import com.gxjzy.domain.PlPlantinfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PlPlantinfoMapper {

    //查询植物详情的数据列表
    List<PlPlantinfo> list();

    //分页和搜索查询植物详情的数据列表
    List<PlPlantinfo> getListView(int page, int limit, String where);

    //查询植物详情数据的总条数
    int getListCount(@Param("where") String where);

    //根据id删除详情信息
    int delete(String id);

    //根据id修改详情信息
    int update(PlPlantinfo plPlantinfo);

    //添加详情信息
    int save(PlPlantinfo plPlantinfo);

    //批量删除详情信息,接收PlPlantinfo列表
    int deleteBatch(@Param("plPlantinfos") List<PlPlantinfo> plPlantinfos);

    //根据id查询植物信息
    PlPlantinfo detail(String id);

    //根据id修改发布状态
    int changeState(@Param("id") String id,@Param("isstate") boolean isstate);
}
