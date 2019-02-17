package com.ssm.service;

import com.github.pagehelper.PageInfo;
import com.ssm.entity.TUser;

public interface UserService {
    TUser getById(Integer id);
    int deleteById(Integer id);
    int add(TUser t);
    int update(TUser t);
    PageInfo<TUser> page(int pageNum,int pageSize, TUser t);

    TUser login(TUser user);
}
