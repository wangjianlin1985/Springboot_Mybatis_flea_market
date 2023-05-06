package com.dong.service;

import com.dong.mapper.GoodMapper;
import com.dong.pojo.Good;
import com.dong.vo.GoodResult;
import com.dong.vo.PageResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class GoodService {

    @Autowired
    private GoodMapper goodMapper;

    public void saveGood(Good good){
        goodMapper.saveGood(good);
    }

    public List<Good> selectGoodsBySid(Integer sid){
       return goodMapper.selectGoodsBySid(sid);
    }

    public Good selectGoodById(Integer id){
        return goodMapper.selectGoodById(id);
    }

    public void updateGood(Good good){
        goodMapper.updateGood(good);
    }

    public Integer countGoodBySid(Integer sid){
        return goodMapper.countGoodBySid(sid);
    }

    public GoodResult selectDetailGood(Integer id){
        return goodMapper.selectDetailGood(id);
    }

    public PageResult<GoodResult> selectPage(PageResult pageResult,String name){
        PageHelper.startPage(pageResult.getCurrentPage(), pageResult.getPageSize());
        List<GoodResult> goodResults = goodMapper.selectPage(name);
        PageInfo pageInfo=new PageInfo(goodResults);
        return new PageResult<>(pageInfo.getPageNum(),pageInfo.getPageNum(),pageInfo.getPages(),pageInfo.getTotal(),goodResults);
    }

    public PageResult<GoodResult> findList(List<Integer> ids,PageResult pageResult) {
        PageHelper.startPage(pageResult.getCurrentPage(),pageResult.getPageSize() );
        List<GoodResult> goodResults=new ArrayList<>();
        for(Integer id:ids){
            for(GoodResult goodResult:goodMapper.selectList(id)) {
                goodResults.add(goodResult);
            }
        }
        PageInfo pageInfo=new PageInfo(goodResults);
        return new PageResult<>(pageInfo.getPageNum(),pageInfo.getPageSize(),pageInfo.getPages(),pageInfo.getTotal(),goodResults);
    }

    public PageResult<GoodResult> selectPages(PageResult pageResult,String name){
        PageHelper.startPage(pageResult.getCurrentPage(), pageResult.getPageSize());
        List<GoodResult> goodResults = goodMapper.selectPages(name);
        PageInfo pageInfo=new PageInfo(goodResults);
        return new PageResult<>(pageInfo.getPageNum(),pageInfo.getPageSize(),pageInfo.getPages(),pageInfo.getTotal(),goodResults);
    }

    public  int selectGoodByStatus(Integer status){
        return goodMapper.selectGoodByStatus(status);
    }

    public void deleteGood(Integer id){
        goodMapper.deleteGood(id);
    }
}
