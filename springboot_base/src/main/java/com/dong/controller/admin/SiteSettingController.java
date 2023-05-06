package com.dong.controller.admin;

import com.dong.exception.CodeMsg;
import com.dong.exception.Result;
import com.dong.pojo.SiteSetting;
import com.dong.service.LogService;
import com.dong.service.SiteSettingService;
import com.dong.utils.ValidataUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("admin/site_setting")
public class SiteSettingController {
    @Autowired
    private SiteSettingService siteSettingService;

    @Autowired
    private LogService logService;

    @GetMapping("setting")
    public String setting(Model model){
        model.addAttribute("siteSetting", siteSettingService.selectSite());
        return "admin/site_setting/setting";
    }

    @PutMapping("save_setting")
    @ResponseBody
    public Result<Boolean> save_setting(SiteSetting siteSetting){
        CodeMsg validata = ValidataUtil.validata(siteSetting);
        if(validata.getCode()!=CodeMsg.SUCCESS.getCode()){
            return Result.exception(validata);
        }
        siteSettingService.updateSite(siteSetting);
        logService.addLog("修改网站设置"+siteSetting);
        return Result.success(true);
    }
}
