package com.dong.controller.admin;

import com.dong.config.TitleConfig;
import com.dong.exception.Result;
import com.dong.pojo.Log;
import com.dong.service.LogService;
import com.dong.vo.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("admin/log")
public class LogController {

    @Autowired
    private LogService logService;

    @Autowired
    private TitleConfig titleConfig;


    /**
     * 日志列表
     * @param model
     * @param log
     * @param pageResult
     * @return
     */
    @GetMapping("list")
    public String list(Model model, Log log, PageResult pageResult) {
        model.addAttribute("title",titleConfig.getLogTitle() );
        model.addAttribute("operator",log.getOperator());
        model.addAttribute("pageResult", logService.selectPage(log,pageResult ));
        return "/admin/system/log_list";
    }


    /**
     * 日志删除
     * @param ids
     * @return
     */
    @DeleteMapping("delete")
    @ResponseBody
    public Result<Boolean> delete(@RequestParam(value = "ids",required = true) String ids){
        logService.deleteLog(ids);
        return Result.success(true);
    }

    /**
     * 删除全部日志
     * @return
     */
    @DeleteMapping("deleteAll")
    @ResponseBody
    public Result<Boolean> deleteAll(){
        logService.deleteAll();
        return Result.success(true);
    }
}
