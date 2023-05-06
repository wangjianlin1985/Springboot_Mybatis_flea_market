package com.dong.controller.admin;

import com.dong.config.TitleConfig;
import com.dong.exception.CodeMsg;
import com.dong.exception.Result;
import com.dong.pojo.Menu;
import com.dong.service.LogService;
import com.dong.service.MenuService;
import com.dong.utils.MenuUtil;
import com.dong.utils.ValidataUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Controller
@RequestMapping("admin/menu")
public class MenuController {

    @Autowired
    private MenuService menuService;

    @Autowired
    private TitleConfig titleConfig;

    @Autowired
    private LogService logService;

    Logger logger=LoggerFactory.getLogger(MenuController.class);

    /**
     * 菜单列表
     * @param model
     * @return
     */
    @GetMapping(value = "list")
    public String list(Model model){
        model.addAttribute("topMenus", MenuUtil.getTopMenus(menuService.selectAllMenu()));
        model.addAttribute("secondMenus", MenuUtil.getSecondMenus(menuService.selectAllMenu()));
        model.addAttribute("thirdMenus", MenuUtil.getThirdMenus(menuService.selectAllMenu()));
        model.addAttribute("title", titleConfig.getMenuTitle());
        return "admin/menu/list";
    }



    @GetMapping(value = "add")
    public String add(Model model){
        model.addAttribute("topMenus", MenuUtil.getTopMenus(menuService.selectAllMenu()));
        model.addAttribute("secondMenus", MenuUtil.getSecondMenus(menuService.selectAllMenu()));
        return "admin/menu/add";
    }

    /**
     * 添加菜单
     * @param menu
     * @return
     */
    @PostMapping(value = "add")
    @ResponseBody
    public Result<Boolean> add(Menu menu){
        if(StringUtils.isEmpty(menu)){
            return Result.exception(CodeMsg.DATA_ERROR);
        }
        CodeMsg validata = ValidataUtil.validata(menu);
        if(validata.getCode()!=CodeMsg.SUCCESS.getCode()){
            return  Result.exception(validata);
        }
        try {
            menuService.save(menu);
        }catch (Exception e){
            return Result.exception(CodeMsg.ADMIN_MENU_ADD_ERROR);
        }
        logger.info("添加一个url为:"+menu.getUrl()+"的分类");
        logService.addLog("添加菜单,菜单名为:"+menu.getName());
        return Result.success(true);
    }

    @GetMapping(value = "edit")
    public String selectMenuById(@RequestParam(value = "id",required = true) Integer id,Model model){
        List<Menu> menus = menuService.selectAllMenu();
        model.addAttribute("topMenus",MenuUtil.getTopMenus(menus));
        model.addAttribute("secondMenus",MenuUtil.getSecondMenus(menus));
        model.addAttribute("menu", menuService.selectMenuById(id));
        return "admin/menu/edit";
    }

    /**
     * 编辑菜单
     * @param menu
     * @return
     */
    @PutMapping("edit")
    @ResponseBody
    public Result<Boolean> editMenu(Menu menu){
        if(StringUtils.isEmpty(menu)){
          return   Result.exception(CodeMsg.DATA_ERROR);
        }

        if(StringUtils.isEmpty(menu.getId())){
            return Result.exception(CodeMsg.ADMIN_MENU_ID_ERROR);
        }

        CodeMsg validata = ValidataUtil.validata(menu);
        if(validata.getCode()!=CodeMsg.SUCCESS.getCode()){
            return Result.exception(validata);
        }
        try {
            menuService.update(menu);
        }catch (Exception e){
            return Result.exception(CodeMsg.ADMIN_ROLE_EDIT_ERROR);
        }
        logService.addLog("更新菜单,菜单名为:"+menu.getName());
        return Result.success(true);
    }


    /**
     * 删除菜单
     * @param id
     * @return
     */
    @DeleteMapping(value = "delete")
    @ResponseBody
    public  Result<Boolean> deleteMenu(@RequestParam(value = "id",required = true) Integer id){
        try {
            menuService.deleteMenu(id);
        }catch (Exception e){
            return Result.exception(CodeMsg.ADMIN_MENU_DELETE_ERROR);
        }
        logService.addLog("删除菜单,菜单ID为:"+id);
        return Result.success(true);
    }




}
