package com.ssm.service;

import com.github.pagehelper.PageInfo;
import com.ssm.entity.TApply;

public interface ApplyService {
    TApply getById(Integer id);
    int deleteById(Integer id);
    int add(TApply t);
    int update(TApply t);
    PageInfo<TApply> page(int pageNum, int pageSize, TApply t);
}
