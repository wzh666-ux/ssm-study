package com.gxjzy.dao;

import com.gxjzy.domain.PlStudent;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PlStudentMapper {

    //查询学生的数据列表
    List<PlStudent> list();
    //分页和搜索查询学生的数据列表
    List<PlStudent> getListView(int page, int limit, String where);

    //查询学生数据的总条数
    int getListCount(@Param("where") String where);

    int deleteByPrimaryKey(String id);

    int insert(PlStudent record);

    int insertSelective(PlStudent record);

    PlStudent selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PlStudent record);

    int updateByPrimaryKey(PlStudent record);

    //批量删除信息,接收PlCategory列表
    int deleteBatch(@Param("plStudents") List<PlStudent> plStudents);
}