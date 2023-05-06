package com.dong.controller.admin;

import com.alibaba.fastjson.JSONArray;
import com.dong.config.TitleConfig;
import com.dong.exception.CodeMsg;
import com.dong.exception.Result;
import com.dong.pojo.Menu;
import com.dong.pojo.Role;
import com.dong.service.LogService;
import com.dong.service.MenuService;
import com.dong.service.RoleService;
import com.dong.utils.MenuUtil;
import com.dong.utils.ValidataUtil;
import com.dong.vo.PageResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("admin/role")
@Controller
public class RoleController {

    @Autowired
    private RoleService roleService;

    @Autowired
    private TitleConfig titleConfig;

    @Autowired
    private MenuService menuService;

    @Autowired
    private LogService logService;

    Logger logger=LoggerFactory.getLogger(RoleController.class);

    /**
     * 角色列表
     * @param model
     * @param pageResult
     * @return
     */
    @GetMapping("list")
    public String list(Model model, PageResult pageResult){
        model.addAttribute("title", titleConfig.getRoleTitle());
        model.addAttribute("pageResult",roleService.selectPage(pageResult));
        return "admin/role/list";
    }

    @GetMapping("add")
    public String add(Model model){
        List<Menu> menus = menuService.selectAllMenu();
        model.addAttribute("topMenus", MenuUtil.getTopMenus(menus));
        model.addAttribute("secondMenus", MenuUtil.getSecondMenus(menus));
        model.addAttribute("thirdMenus", MenuUtil.getThirdMenus(menus));
        return "admin/role/add";
    }


    /**
     * 添加角色
     * @param role
     * @param menuId
     * @return
     */
    @PostMapping("add")
    @ResponseBody
    public Result<Boolean> saveRole(Role role, @RequestParam("menuId") List<Integer> menuId){
        CodeMsg validata = ValidataUtil.validata(role);
        if(validata.getCode()!=CodeMsg.SUCCESS.getCode()){
            return Result.exception(validata);
        }

        try {
            roleService.saveRole(role, menuId);
        }catch (Exception e){
            return Result.exception(CodeMsg.ADMIN_ROLE_ADD_ERROR);
        }
        logService.addLog("添加权限,权限名为:"+role.getName());
        logger.info("添加权限,权限名为:"+role.getName());
        return Result.success(true);
    }

    @GetMapping("edit")
    public String edit(Model model, @RequestParam(value = "id",required = true) Integer id){
        model.addAttribute("role", roleService.selectRoleById(id));
        List<Menu> menus = menuService.selectAllMenu();
        model.addAttribute("topMenus", MenuUtil.getTopMenus(menus));
        model.addAttribute("secondMenus", MenuUtil.getSecondMenus(menus));
        model.addAttribute("thirdMenus", MenuUtil.getThirdMenus(menus));
        model.addAttribute("authorities", JSONArray.toJSON(roleService.selectMenuIdById(id).toString()));
        return "admin/role/edit";
    }


    /**
     * 编辑角色
     * @param role
     * @param menuId
     * @return
     */
    @PutMapping("edit")
    @ResponseBody
    public Result<Boolean> edit(Role role,@RequestParam("menuId") List<Integer> menuId){
        CodeMsg validata = ValidataUtil.validata(role);
        if(validata.getCode()!=CodeMsg.SUCCESS.getCode()){
            return Result.exception(validata);
        }

        try {
            roleService.updateRole(role,menuId);
        }catch (Exception e){
            return Result.exception(CodeMsg.ADMIN_ROLE_EDIT_ERROR);
        }
        logService.addLog("更新权限,权限名为:"+role.getName());
        logger.info("更新权限,权限名为:"+role.getName());
        return Result.success(true);
    }

    /**
     * 删除角色
     * @param id
     * @return
     */
    @DeleteMapping("delete")
    @ResponseBody
    public Result<Boolean> delete(@RequestParam(value = "id",required = true) Integer id){
        try{
            roleService.deleteRole(id);
        }catch(Exception e){
           return Result.exception(CodeMsg.ADMIN_ROLE_DELETE_ERROR);
        }
        logService.addLog("删除权限,权限ID为:"+id);
        logger.info("删除权限,权限ID为:"+id);
        return Result.success(true);
    }

}
