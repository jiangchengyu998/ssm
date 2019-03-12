package com.ssm.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.dao.TApplyMapper;
import com.ssm.entity.TApply;
import com.ssm.entity.TApplyExample;
import com.ssm.service.ApplyService;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class ApplyServiceImpl implements ApplyService {

    @Resource
    private TApplyMapper tApplyMapper;


    @Override
    public TApply getById(Integer id) {
        return tApplyMapper.selectByPrimaryKey(id);
    }

    @Override
    public int deleteById(Integer id) {
        return tApplyMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int add(TApply t) {
        Date date = new Date();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String format = dateFormat.format(date);
        t.setApplyTime(format);
        return tApplyMapper.insertSelective(t);
    }

    @Override
    public int update(TApply t) {
        Date date = new Date();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String format = dateFormat.format(date);
        t.setApplyTime(format);
        return tApplyMapper.updateByPrimaryKeySelective(t);
    }

    @Override
    public PageInfo<TApply> page(int pageNum,int pageSize,TApply t) {
        PageHelper.startPage(pageNum, pageSize);
        TApplyExample example = new TApplyExample();
        TApplyExample.Criteria criteria = example.createCriteria();
        if(!StringUtils.isEmpty(t.getUserId())){
            criteria.andUserIdEqualTo(t.getUserId());
        }
        List<TApply> list = tApplyMapper.selectByExample(example);
        return new PageInfo<TApply>(list);
    }

}
