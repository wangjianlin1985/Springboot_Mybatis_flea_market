package com.dong.utils;

import com.dong.pojo.Category;

import java.util.ArrayList;
import java.util.List;

public class CategoryUtil {

    public static List<Category> getParentCategory(List<Category> categorieList){
        List<Category> parentCategory = new ArrayList<Category>();
        for(Category category :categorieList){
            if(category.getParentId() == null){
                parentCategory.add(category);
            }
        }
        return parentCategory;
    }
}
