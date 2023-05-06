package com.dong.controller.home;

import com.dong.exception.Result;
import com.dong.pojo.Category;
import com.dong.pojo.Good;
import com.dong.service.CategoryService;
import com.dong.service.CommentService;
import com.dong.service.GoodService;
import com.dong.vo.CommentResult;
import com.dong.vo.GoodResult;
import com.dong.vo.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RequestMapping("/home/goods")
@Controller
public class HomeGoodController {

    @Autowired
    private GoodService goodService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private CommentService commentService;

    @GetMapping("detail")
    public String detail(@RequestParam(value = "id",required = true) Integer id, Model model){
        Good good = goodService.selectGoodById(id);
        if(StringUtils.isEmpty(good)){
            model.addAttribute("msg", "物品不存在！");
            return "error/runtime_error";
        }
        GoodResult goods = goodService.selectDetailGood(id);
        List<CommentResult> comments = commentService.selectCommentByGid(id);
        model.addAttribute("goods",goods );
        model.addAttribute("commentList", comments);
        good.setViewNumber(good.getViewNumber()+1);
        goodService.updateGood(good);
        return "home/goods/detail";
    }

    @GetMapping("list")
    public String list(PageResult pageResult,@RequestParam(value = "id",required = true)Integer id,Model model){
        pageResult.setPageSize(12);
        Category category = categoryService.selectCategoryById(id);
        if(StringUtils.isEmpty(category)){
            model.addAttribute("msg", "物品分类不存在！");
            return "error/runtime_error";
        }
        List<Integer> list=new ArrayList<>();
        if(StringUtils.isEmpty(category.getParentId())){
            List<Category> categories = categoryService.selectSecondCategory(id);
            for(Category cate:categories){
                list.add(cate.getId());
            }
        }else{
            list.add(id);
        }
        PageResult<GoodResult> goodResult = goodService.findList(list, pageResult);
        model.addAttribute("pageResult",goodResult );
        model.addAttribute("gc",category );
        return "home/goods/list";
    }

    @PostMapping("get_sold_total")
    @ResponseBody
    public Result<Integer> getTotalCount(){
      return  Result.success(goodService.selectGoodByStatus(Good.GOOD_STATUS_SOLD));
    }
}
