package com.ssm.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.dao.TUserMapper;
import com.ssm.entity.TUser;
import com.ssm.entity.TUserExample;
import com.ssm.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
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
        Date date = new Date();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String format = dateFormat.format(date);
        t.setCreateTime(format);
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
        TUserExample.Criteria criteria = example.createCriteria();
        if(!StringUtils.isEmpty(t.getUsername())){
            criteria.andUsernameLike(t.getUsername());
        }
        if(!StringUtils.isEmpty(t.getPhone())){
            criteria.andPhoneLike(t.getPhone());
        }
        List<TUser> tUsers = tUserMapper.selectByExample(example);
        return new PageInfo<TUser>(tUsers);
    }

    @Override
    public TUser login(TUser user) {
        TUserExample example = new TUserExample();
        TUserExample.Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(user.getUsername());
        criteria.andPasswordEqualTo(user.getPassword());
        List<TUser> tUsers = tUserMapper.selectByExample(example);
        if(CollectionUtils.isEmpty(tUsers)){
            return null;
        }else {
            return tUsers.get(0);
        }
    }
}
