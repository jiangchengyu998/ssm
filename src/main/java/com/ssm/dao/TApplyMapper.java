package com.ssm.dao;

import com.ssm.entity.TApply;
import com.ssm.entity.TApplyExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TApplyMapper {
    int countByExample(TApplyExample example);

    int deleteByExample(TApplyExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TApply record);

    int insertSelective(TApply record);

    List<TApply> selectByExample(TApplyExample example);

    TApply selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TApply record, @Param("example") TApplyExample example);

    int updateByExample(@Param("record") TApply record, @Param("example") TApplyExample example);

    int updateByPrimaryKeySelective(TApply record);

    int updateByPrimaryKey(TApply record);
}