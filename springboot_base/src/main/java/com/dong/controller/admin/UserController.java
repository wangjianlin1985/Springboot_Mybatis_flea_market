package com.dong.controller.admin;

import com.dong.config.TitleConfig;
import com.dong.exception.CodeMsg;
import com.dong.exception.Result;
import com.dong.pojo.User;
import com.dong.service.LogService;
import com.dong.service.RoleService;
import com.dong.service.UserService;
import com.dong.utils.ValidataUtil;
import com.dong.vo.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("admin/user")
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private TitleConfig titleConfig;

    @Autowired
    private RoleService roleService;

    @Autowired
    private LogService logService;

    /**
     * 管理员列表
     * @param model
     * @param pageResult
     * @param user
     * @return
     */
    @GetMapping("list")
    public String list(Model model, PageResult pageResult,User user){
        model.addAttribute("title", titleConfig.getUserTitle());
        model.addAttribute("username",user.getUsername() );
        model.addAttribute("pageResult", userService.selectPage(pageResult,user));
        return "admin/user/list";
    }

    @GetMapping("add")
    public String addUser(Model model){
        model.addAttribute("roles",roleService.selectAllRole());
        return "admin/user/add";
    }

    /**
     * 添加管理员
     * @param user
     * @return
     */
    @PostMapping("add")
    @ResponseBody
    public Result<Boolean> addUser(User user){
        CodeMsg validata = ValidataUtil.validata(user);
        if(validata.getCode()!=CodeMsg.SUCCESS.getCode()){
            return  Result.exception(validata);
        }
        if(StringUtils.isEmpty(user.getRole())){
            return Result.exception(CodeMsg.ADMIN_USER_ROLE_EMPTY);
        }
        if(!StringUtils.isEmpty(userService.selectUserByName(user.getUsername()))){
            return  Result.exception(CodeMsg.ADMIN_USERNAME_EXIST);
        }
        try {
            userService.saveUser(user);
        }catch (Exception e){
            return Result.exception(CodeMsg.ADMIN_USER_ADD_ERROR);
        }
        if(StringUtils.isEmpty(user.getId())){
            return Result.exception(CodeMsg.ADMIN_USER_ADD_ERROR);
        }
        logService.addLog("添加用户,用户名为:"+user.getUsername());
        return Result.success(true);
    }

    @GetMapping("edit")
    public String editUser(Model model,@RequestParam(value = "id",required = true) Integer id){
        model.addAttribute("roles",roleService.selectAllRole());
        model.addAttribute("user", userService.selectUserById(id));
        return "/admin/user/edit";
    }

    /**
     * 编辑管理员
     * @param user
     * @return
     */
    @PutMapping("edit")
    @ResponseBody
    public Result<Boolean> editUser(User user){
        CodeMsg validata = ValidataUtil.validata(user);
        if(validata.getCode()!=CodeMsg.SUCCESS.getCode()){
            return Result.exception(validata);
        }

        if(!StringUtils.isEmpty(userService.selectUserByName(user.getUsername()))){
            return  Result.exception(CodeMsg.ADMIN_USERNAME_EXIST);
        }

        if(StringUtils.isEmpty(user.getRole())){
            return Result.exception(CodeMsg.ADMIN_USER_ROLE_EMPTY);
        }

        if(StringUtils.isEmpty(user.getId())){
            return Result.exception(CodeMsg.ADMIN_USE_NO_EXIST);
        }

        try {
            userService.updateUser(user);
        }catch (Exception e){
            return  Result.exception(CodeMsg.ADMIN_USER_EDIT_ERROR);
        }
        logService.addLog("更新用户,用户名为:"+user.getUsername());
        return Result.success(true);
    }


    /**
     * 删除管理员
     * @param id
     * @return
     */
    @DeleteMapping("delete")
    @ResponseBody
    public Result<Boolean> deleteUser(@RequestParam(value = "id",required = true) Integer id){
        if(StringUtils.isEmpty(id)){
            return Result.exception(CodeMsg.ADMIN_USE_NO_EXIST);
        }
        try {
            userService.deleteUser(id);
        }catch(Exception e){
            return Result.exception(CodeMsg.ADMIN_USER_DELETE_ERROR);
        }
        logService.addLog("删除用户,用户ID为:"+id);
        return Result.success(true);

    }



}
