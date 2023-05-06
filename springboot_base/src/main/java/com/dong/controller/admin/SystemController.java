package com.dong.controller.admin;

import com.dong.constant.SessionConstant;
import com.dong.exception.CodeMsg;
import com.dong.exception.Result;
import com.dong.listener.SessionListener;
import com.dong.pojo.User;
import com.dong.service.LogService;
import com.dong.service.UserService;
import com.dong.utils.StringUtil;
import com.dong.utils.ValidataUtil;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@RequestMapping("system")
public class SystemController {

    @Autowired
    private UserService userService;

    @Autowired
    private LogService logService;


    Logger logger= LoggerFactory.getLogger(UserController.class);


    /**
     * 管理员登录
     * @param user
     * @param cpacha
     * @param session
     * @return
     */
    @PostMapping(value = "/login_form")
    @ResponseBody
    public Result<Boolean> Login(User user, String cpacha,HttpSession session){
        CodeMsg validata = ValidataUtil.validata(user);
        if(validata.getCode()!=CodeMsg.SUCCESS.getCode()){
            return Result.exception(validata);
        }

        if(StringUtils.isEmpty(cpacha)){
            return Result.exception(CodeMsg.CPACHA_EMPTY);
        }

        Object adminCpacha =session.getAttribute("admin_login");

       if(adminCpacha==null){
            return Result.exception(CodeMsg.SESSION_EXPIRED);
        }

        if(!cpacha.equalsIgnoreCase(adminCpacha.toString())){
            return Result.exception(CodeMsg.CPACHA_ERROR);
        }

        User users = userService.selectUserByName(user.getUsername());

        if(users==null){
            return Result.exception(CodeMsg.ADMIN_USERNAME_EXIST);
        }

        if(!users.getPassword().equals(user.getPassword())){
            return Result.exception(CodeMsg.ADMIN_PASSWORD_ERROR);
        }

        if(users.getStatus()==User.ADMIN_USER_STATUS_UNABLE){
            return Result.exception(CodeMsg.ADMIN_USER_UNABLE);
        }

        //检查一切符合，可以登录，将用户信息存放至session
        session.setAttribute(SessionConstant.USER_SESSION, users);

        //销毁验证码
        session.removeAttribute("admin_login");
        logger.info("用户成功登录,user="+users);
        logService.addLog(user.getUsername(),"【"+user.getUsername()+"】"+"用户在"+ StringUtil.dataFormat(new Date(), "yyyy-MM-dd HH:mm:ss")+"登录系统!");
        return Result.success(true);
    }

    /**
     * 后台主页
     * @param model
     * @return
     */
    @GetMapping(value = "index")
    public String index(Model model){
        model.addAttribute("userTotal", userService.selectUserTotal());
        model.addAttribute("operatorLogTotal", logService.selectLogTotal());
        model.addAttribute("operatorLogs", logService.selectRecentLog());
        model.addAttribute("onlineUserTotal", SessionListener.onlineUserCount);
        return "admin/system/index";
    }

    /**
     * 修改信息
     * @param user
     * @param session
     * @return
     */
    @PutMapping(value = "update_userinfo")
    @ResponseBody
    public Result<Boolean> update_userinfo(User user,HttpSession session){
        User users =(User) session.getAttribute(SessionConstant.USER_SESSION);
        if(userService.selectUserByName(user.getUsername()) != null){
            return  Result.exception(CodeMsg.ADMIN_USERNAME_EXIST);
        }
        users.setImage(user.getImage());
        users.setEmail(user.getEmail());
        users.setMobile(user.getMobile());
         userService.updateUser(user);
        logService.addLog(user.getUsername(),"【"+user.getUsername()+"】"+"用户在"+ StringUtil.dataFormat(new Date(), "yyyy-MM-dd HH:mm:ss")+"修改了自己的信息!");
        return Result.success(true);
    }

    /**
     * 修改密码
     * @param oldpwd
     * @param newpwd
     * @param id
     * @param session
     * @return
     */
    @PutMapping(value = "update_pwd")
    @ResponseBody
    public Result<Boolean> update_pwd(@RequestParam(value = "oldPwd",required = true) String oldpwd,
                                      @RequestParam(value = "newPwd",required = true) String newpwd,
                                      @RequestParam(value = "id",required = true) Integer id,
                                      HttpSession session){
        User user =(User) session.getAttribute(SessionConstant.USER_SESSION);
        if(!user.getPassword().equals(oldpwd)){
            return Result.exception(CodeMsg.ADMIN_USER_UPDATE_PWD_ERROR);
        }
        if(StringUtils.isEmpty(newpwd)){
            return Result.exception(CodeMsg.ADMIN_USER_UPDATE_PWD_EMPTY);
        }
        if(newpwd.length()<6){
            return Result.exception(CodeMsg.ADMIN_PASSWORD_MINLENGTH);
        }
        if(newpwd.length()>18){
            return Result.exception(CodeMsg.ADMIN_PASSWORD_MAXLENGTH);
        }
        User user1 = new User();
        user1.setId(id);
        user1.setPassword(newpwd);
        userService.updateUser(user1);
        user.setPassword(newpwd);
        logService.addLog(user.getUsername(),"【"+user.getUsername()+"】"+"用户在"+ StringUtil.dataFormat(new Date(), "yyyy-MM-dd HH:mm:ss")+"更新了自己的密码!");
        return Result.success(true);
    }

    /**
     * 退出登录
     * @param session
     * @return
     */
    @GetMapping(value = "logout")
    public String logout(HttpSession session){
        session.removeAttribute(SessionConstant.USER_SESSION);
        return "redirect:login";
    }
}
