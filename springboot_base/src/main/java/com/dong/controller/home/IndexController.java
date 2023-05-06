package com.dong.controller.home;

import com.dong.constant.SessionConstant;
import com.dong.exception.CodeMsg;
import com.dong.exception.Result;
import com.dong.pojo.News;
import com.dong.pojo.Student;
import com.dong.service.GoodService;
import com.dong.service.NewsService;
import com.dong.service.StudentService;
import com.dong.utils.ValidataUtil;
import com.dong.vo.GoodResult;
import com.dong.vo.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/home/index")
public class IndexController {
    @Autowired
    private StudentService studentService;

    @Autowired
    private NewsService newsService;

    @Autowired
    private GoodService goodService;

    @RequestMapping("index")
    public String index(Model model, PageResult pageResult, @RequestParam(value = "name",required = false,defaultValue = "") String name){
        pageResult.setPageSize(12);
        PageResult<GoodResult> goodList = goodService.selectPage(pageResult, name);
        model.addAttribute("pageResult",goodList );
        model.addAttribute("name",name );
        model.addAttribute("newsList", newsService.selectPage(pageResult, null).getContent());
        return "/home/index/index";
    }

    @GetMapping("news_detail")
    public String newDetail(Model model,@RequestParam("id")Integer id){
        News news = newsService.selectNewsById(id);
        model.addAttribute("news",news );
        return "home/index/news_detail";
    }

    @RequestMapping("login")
    public String login(){
        return "/home/index/login";
    }

    @PostMapping("check_sno")
    @ResponseBody
    public Result<Boolean> check_sno(Student student){
        return Result.success(StringUtils.isEmpty(studentService.selectStudent(student)));
    }

    @PostMapping("register")
    @ResponseBody
    public Result<Boolean> register(Student student, HttpSession session){
        CodeMsg validata = ValidataUtil.validata(student);
        if(validata.getCode()!= CodeMsg.SUCCESS.getCode()){
            return Result.exception(validata);
        }

        if(!StringUtils.isEmpty(studentService.selectStudent(student))){
            return Result.exception(CodeMsg.HOME_STUDENT_SN_NO_EXIST);
        }
        studentService.saveStuent(student);
        if(StringUtils.isEmpty(student)){
           return Result.exception(CodeMsg.HOME_STUDENT_REGISTER_ERROR);
        }
        session.setAttribute(SessionConstant.STUDENT_SESSION, student);
        return Result.success(true);
    }

    @PostMapping("login")
    @ResponseBody
    public Result<Boolean> login(Student student,HttpSession session){
        Student student1 = studentService.selectStudent(student);
        if(StringUtils.isEmpty(student1)){
            return Result.exception(CodeMsg.HOME_STUDENT_SN_NO_EXIST);
        }

        if(!student1.getPassword().equals(student1.getPassword())){
            return Result.exception(CodeMsg.HOME_STUDENT_PASSWORD_ERROR);
        }
        if(student1.getStatus() !=Student.STUDENT_STATUS_ENABLE ){
            return Result.exception(CodeMsg.HOME_STUDENT_UNABLE);
        }
        session.setAttribute(SessionConstant.STUDENT_SESSION,student1 );
        return Result.success(true);
    }

    @GetMapping("logout")
    public String logout(HttpSession  session){
        session.removeAttribute(SessionConstant.STUDENT_SESSION);
        return "redirect:index";
    }
}
