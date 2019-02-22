package com.ssm.service;

import com.github.pagehelper.PageInfo;
import com.ssm.entity.TClothesType;

public interface ClothesTypeService {
    TClothesType getById(Integer id);
    int deleteById(Integer id);
    int add(TClothesType t);
    int update(TClothesType t);
    PageInfo<TClothesType> page(int pageNum, int pageSize, TClothesType t);
}
