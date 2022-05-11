package com.gxjzy.dao;

import com.gxjzy.domain.Details;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DetailsMapper {

    List<Details> list();
    //分页和搜索查询植物科类的数据列表
    List<Details> getListView(int page, int limit, String where);

    //查询数据的总条数
    int getListCount(@Param("where") String where);

    //根据id修改信息
    int update(Details details);

    //添加信息
    int save(Details details);

    int delete(String id);
    //批量删除
    int deleteBatch(@Param("plDetail") List<Details> details);
}
