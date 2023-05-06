package com.dong.mapper;

import com.dong.pojo.Category;

import java.util.List;

public interface CategoryMapper {

    void saveCategory(Category category);

    Category selectCategoryById(Integer id);

    List<Category> selectAll();

    List<Category> selectPage(String name);

    void updateCategory(Category category);

    void deleteCategory(Integer id);

    List<Category> selectSecondCategory(Integer pid);
}
