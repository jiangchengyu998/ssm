package com.ssm.dao;

import com.ssm.entity.TClothes;
import com.ssm.entity.TClothesExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TClothesMapper {
    int countByExample(TClothesExample example);

    int deleteByExample(TClothesExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TClothes record);

    int insertSelective(TClothes record);

    List<TClothes> selectByExample(TClothesExample example);

    TClothes selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TClothes record, @Param("example") TClothesExample example);

    int updateByExample(@Param("record") TClothes record, @Param("example") TClothesExample example);

    int updateByPrimaryKeySelective(TClothes record);

    int updateByPrimaryKey(TClothes record);
}