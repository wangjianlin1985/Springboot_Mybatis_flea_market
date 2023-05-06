package com.dong.controller.admin;

import com.dong.config.TitleConfig;
import com.dong.exception.CodeMsg;
import com.dong.exception.Result;
import com.dong.pojo.News;
import com.dong.service.NewsService;
import com.dong.utils.ValidataUtil;
import com.dong.vo.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@RequestMapping("admin/news")
@Controller
public class NewsController {

    @Autowired
    private NewsService newsService;

    @Autowired
    private TitleConfig titleConfig;

    @GetMapping("list")
    public String list(PageResult pageResult, Model model, @RequestParam(value = "newsTitle",required = false,defaultValue = "")String title){
        model.addAttribute("title",titleConfig.getNewsTitle() );
        model.addAttribute("newsTitle", title);
        model.addAttribute("pageResult",newsService.selectPage(pageResult,title ));
        return "admin/news/list";
   }

   @GetMapping("add")
   public String add(){
        return "admin/news/add";
   }

   @PostMapping("add")
   @ResponseBody
    public Result<Boolean> add(News news){
       CodeMsg validata = ValidataUtil.validata(news);
       if(validata.getCode() != CodeMsg.SUCCESS.getCode()){
           return Result.exception(validata);
       }
       newsService.save(news);
       return Result.success(true);
   }

   @GetMapping("edit")
    public String edit(Model model,@RequestParam("id")Integer id){
       News news = newsService.selectNewsById(id);
       model.addAttribute("news", news);
       return "admin/news/edit";
   }

   @PutMapping("edit")
   @ResponseBody
    public Result<Boolean> edit(News news){
       CodeMsg validata = ValidataUtil.validata(news);
       if(validata.getCode() != CodeMsg.SUCCESS.getCode()){
           return Result.exception(validata);
       }
       newsService.updateNews(news);
       return Result.success(true);
   }

    @DeleteMapping("delete")
    @ResponseBody
    public Result<Boolean> delete(@RequestParam(value = "id")Integer id){
        newsService.deleteNews(id);
        return Result.success(true);
   }

}
