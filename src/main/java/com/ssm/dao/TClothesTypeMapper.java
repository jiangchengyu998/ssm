package com.ssm.dao;

import com.ssm.entity.TClothesType;
import com.ssm.entity.TClothesTypeExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TClothesTypeMapper {
    int countByExample(TClothesTypeExample example);

    int deleteByExample(TClothesTypeExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TClothesType record);

    int insertSelective(TClothesType record);

    List<TClothesType> selectByExample(TClothesTypeExample example);

    TClothesType selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TClothesType record, @Param("example") TClothesTypeExample example);

    int updateByExample(@Param("record") TClothesType record, @Param("example") TClothesTypeExample example);

    int updateByPrimaryKeySelective(TClothesType record);

    int updateByPrimaryKey(TClothesType record);
}