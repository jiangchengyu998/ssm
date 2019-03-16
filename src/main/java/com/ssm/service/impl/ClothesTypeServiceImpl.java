package com.ssm.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.dao.TClothesTypeMapper;
import com.ssm.entity.TClothesType;
import com.ssm.entity.TClothesTypeExample;
import com.ssm.service.ClothesTypeService;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ClothesTypeServiceImpl implements ClothesTypeService {

    @Resource
    private TClothesTypeMapper tClothesTypeMapper;


    @Override
    public TClothesType getById(Integer id) {
        return tClothesTypeMapper.selectByPrimaryKey(id);
    }

    @Override
    public int deleteById(Integer id) {
        return tClothesTypeMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int add(TClothesType t) {
        return tClothesTypeMapper.insertSelective(t);
    }

    @Override
    public int update(TClothesType t) {
        return tClothesTypeMapper.updateByPrimaryKeySelective(t);
    }

    @Override
    public PageInfo<TClothesType> page(int pageNum,int pageSize,TClothesType t) {
        PageHelper.startPage(pageNum, pageSize);
        TClothesTypeExample example = new TClothesTypeExample();
        TClothesTypeExample.Criteria criteria = example.createCriteria();
        if(t!=null){
            if(!StringUtils.isEmpty(t.getTypeName())){
                criteria.andTypeNameLike("%"+t.getTypeName()+"%");
            }
            if(!StringUtils.isEmpty(t.getType())){
                criteria.andTypeEqualTo(t.getType());
            }
        }

        List<TClothesType> tUsers = tClothesTypeMapper.selectByExample(example);
        return new PageInfo<TClothesType>(tUsers);
    }

}
