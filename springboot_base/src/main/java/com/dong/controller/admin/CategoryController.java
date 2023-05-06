package com.dong.controller.admin;

import com.dong.config.TitleConfig;
import com.dong.exception.CodeMsg;
import com.dong.exception.Result;
import com.dong.pojo.Category;
import com.dong.service.CategoryService;
import com.dong.utils.CategoryUtil;
import com.dong.utils.ValidataUtil;
import com.dong.vo.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("admin/category")
public class CategoryController {

    @Autowired
    private TitleConfig titleConfig;

    @Autowired
    private CategoryService categoryService;

    @GetMapping("list")
    public String list(@RequestParam(value ="name",defaultValue = "") String name, PageResult pageResult, Model model){
        model.addAttribute("title",titleConfig.getCategoryTitle() );
        model.addAttribute("name",name );
        model.addAttribute("pageResult", categoryService.selectPage(name, pageResult));
        model.addAttribute("parentList", CategoryUtil.getParentCategory(categoryService.selectAll()));
        return "/admin/category/list";
    }

    @GetMapping("add")
    public String add(Model model){
        model.addAttribute("parentList",  CategoryUtil.getParentCategory(categoryService.selectAll()));
        return "/admin/category/add";
    }


    @PostMapping("add")
    @ResponseBody
    public Result<Boolean> add(Category category){
        CodeMsg validata = ValidataUtil.validata(category);
        if(validata.getCode()!=CodeMsg.SUCCESS.getCode()){
            return Result.exception(validata);
        }
        try {
            categoryService.saveCategory(category);
        }catch (Exception e){
            return Result.exception(CodeMsg.ADMIN_CATEGORY_ADD_ERROR);
        }
        return Result.success(true);
    }

    @GetMapping("edit")
    public String edit(Model model,@RequestParam(value = "id",required = true) Integer id){
        model.addAttribute("category", categoryService.selectCategoryById(id));
        model.addAttribute("parentList", CategoryUtil.getParentCategory(categoryService.selectAll()));
        return "/admin/category/edit";
    }

    @PutMapping("edit")
    @ResponseBody
    public Result<Boolean> edit(Category category){
        CodeMsg validata = ValidataUtil.validata(category);
        if(validata.getCode()!=CodeMsg.SUCCESS.getCode()){
            return Result.exception(validata);
        }

        try {
            categoryService.updateCategory(category);
        }catch (Exception e){
            Result.exception(CodeMsg.ADMIN_CATEGORY_EDIT_ERROR);
        }
        return Result.success(true);
    }


    @DeleteMapping("delete")
    @ResponseBody
    public Result<Boolean> delete(@RequestParam(value = "id",required = true) Integer id){
        try {
            categoryService.deleteCategory(id);
        }catch (Exception e){
            Result.exception(CodeMsg.ADMIN_CATEGORY_DELETE_ERROR);
        }
        return Result.success(true);
    }

}
