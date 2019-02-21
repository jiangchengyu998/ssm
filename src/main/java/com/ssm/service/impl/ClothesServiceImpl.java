package com.ssm.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.dao.TClothesMapper;
import com.ssm.entity.TClothes;
import com.ssm.entity.TClothesExample;
import com.ssm.service.ClothesService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ClothesServiceImpl implements ClothesService {

    @Resource
    private TClothesMapper tClothesMapper;


    @Override
    public TClothes getById(Integer id) {
        return tClothesMapper.selectByPrimaryKey(id);
    }

    @Override
    public int deleteById(Integer id) {
        return tClothesMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int add(TClothes t) {
        return tClothesMapper.insertSelective(t);
    }

    @Override
    public int update(TClothes t) {
        return tClothesMapper.updateByPrimaryKeySelective(t);
    }

    @Override
    public PageInfo<TClothes> page(int pageNum,int pageSize,TClothes t) {
        PageHelper.startPage(pageNum, pageSize);
        TClothesExample example = new TClothesExample();
        TClothesExample.Criteria criteria = example.createCriteria();
//        if(!StringUtils.isEmpty(t.getUsername())){
//            criteria.andUsernameLike("%"+t.getUsername()+"%");
//        }
//        if(!StringUtils.isEmpty(t.getPhone())){
//            criteria.andPhoneLike("%"+t.getPhone()+"%");
//        }
        List<TClothes> tUsers = tClothesMapper.selectByExample(example);
        return new PageInfo<TClothes>(tUsers);
    }

}