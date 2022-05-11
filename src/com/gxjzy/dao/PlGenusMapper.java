package com.gxjzy.dao;

import com.gxjzy.domain.PlGenus;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PlGenusMapper {

    //查询植物属类的数据列表
    List<PlGenus> list();
    //分页和搜索查询植物属类的数据列表
    List<PlGenus> getListView(int page, int limit, String where);

    //查询植物属类数据的总条数
    int getListCount(@Param("where") String where);

    //根据id删除属类信息
    int delete(String id);

    //根据id修改属类信息
    int update(PlGenus PlGenus);

    //添加属类信息
    int save(PlGenus PlGenus);

    //批量删除属类信息,接收PlGenus列表
    int deleteBatch(@Param("plGenuses") List<PlGenus> plGenuses);

}
