package com.gxjzy.dao;

import com.gxjzy.domain.PlDynamicinfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PlDynamicinfoMapper {

    //查询植物科类的数据列表
    List<PlDynamicinfo> list();
    //分页和搜索查询植物科类的数据列表
    List<PlDynamicinfo> getListView(int page, int limit, String where);

    //查询植物科类数据的总条数
    int getListCount(@Param("where") String where);

    //根据id删除科类信息
    int delete(String id);

    //根据id修改科类信息
    int update(PlDynamicinfo plDynamicinfo);

    //添加科类信息
    int save(PlDynamicinfo plDynamicinfo);

    //批量删除科类信息,接收PlDynamicinfo列表
    int deleteBatch(@Param("plDynamicinfos") List<PlDynamicinfo> plDynamicinfos);

}
