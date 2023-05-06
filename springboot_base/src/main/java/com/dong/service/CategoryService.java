package com.dong.service;

import com.dong.mapper.CategoryMapper;
import com.dong.pojo.Category;
import com.dong.vo.GoodResult;
import com.dong.vo.PageResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CategoryService {
    @Autowired
    private CategoryMapper categoryMapper;

    public void saveCategory(Category category){
        categoryMapper.saveCategory(category);
    }


    public Category selectCategoryById(Integer id){
        return categoryMapper.selectCategoryById(id);
    }

    public List<Category> selectAll(){
        return categoryMapper.selectAll();
    }

    public PageResult<Category> selectPage(String name, PageResult pageResult){
        PageHelper.startPage(pageResult.getCurrentPage(), pageResult.getPageSize());
        List<Category> categoryList = categoryMapper.selectPage(name);
        PageInfo pageInfo=new PageInfo(categoryList);
        return new PageResult<>(pageInfo.getPageNum(),pageInfo.getPageSize(),pageInfo.getPages(),pageInfo.getTotal(),categoryList);
    }

    public void updateCategory(Category category) {
        categoryMapper.updateCategory(category);
    }

    public void deleteCategory(Integer id){
        categoryMapper.deleteCategory(id);
    }

    public List<Category> selectSecondCategory(Integer pid){
        return categoryMapper.selectSecondCategory(pid);
    }




}
