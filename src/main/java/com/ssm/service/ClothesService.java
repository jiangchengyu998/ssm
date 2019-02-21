package com.ssm.service;

import com.github.pagehelper.PageInfo;
import com.ssm.entity.TClothes;

public interface ClothesService {
    TClothes getById(Integer id);
    int deleteById(Integer id);
    int add(TClothes t);
    int update(TClothes t);
    PageInfo<TClothes> page(int pageNum, int pageSize, TClothes t);
}
