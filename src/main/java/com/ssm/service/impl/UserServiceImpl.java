package com.ssm.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.dao.TUserMapper;
import com.ssm.entity.TUser;
import com.ssm.entity.TUserExample;
import com.ssm.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    private TUserMapper tUserMapper;


    @Override
    public TUser getById(Integer id) {
        return tUserMapper.selectByPrimaryKey(id);
    }

    @Override
    public int deleteById(Integer id) {
        return tUserMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int add(TUser t) {
        return tUserMapper.insertSelective(t);
    }

    @Override
    public int update(TUser t) {
        return tUserMapper.updateByPrimaryKeySelective(t);
    }

    @Override
    public PageInfo<TUser> page(int pageNum,int pageSize,TUser t) {
        PageHelper.startPage(pageNum, pageSize);
        TUserExample example = new TUserExample();
        List<TUser> tUsers = tUserMapper.selectByExample(example);
        return new PageInfo<TUser>(tUsers);
    }
}
