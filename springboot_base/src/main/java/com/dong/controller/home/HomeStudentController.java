package com.dong.controller.home;

import com.dong.constant.SessionConstant;
import com.dong.exception.CodeMsg;
import com.dong.exception.Result;
import com.dong.pojo.Category;
import com.dong.pojo.Comment;
import com.dong.pojo.Good;
import com.dong.pojo.Student;
import com.dong.service.CategoryService;
import com.dong.service.CommentService;
import com.dong.service.GoodService;
import com.dong.service.StudentService;
import com.dong.utils.ValidataUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/home/student")
public class HomeStudentController {
    @Autowired
    private StudentService studentService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private GoodService goodService;

    @Autowired
    private CommentService commentService;

    @Autowired
    StringRedisTemplate redisTemplate;




    @GetMapping("index")
    public String index(Model model,HttpSession session){
        Student student=(Student)session.getAttribute(SessionConstant.STUDENT_SESSION);
        model.addAttribute("goodsList", goodService.selectGoodsBySid(student.getId()));
        return "home/student/index";
    }

    @PostMapping("edit_info")
    @ResponseBody
    public Result<Boolean> updateStudent(Student student, HttpSession session){
        if(student.getName().length()<2 || student.getName().length()>16){
            return Result.exception(CodeMsg.HOME_STUDENT_NAME_ERROR);
        }
       Student student1 =(Student)session.getAttribute(SessionConstant.STUDENT_SESSION);
        student1.setName(student.getName());
        student1.setWx(student.getWx());
        student1.setMobile(student.getMobile());
        student1.setSchool(student.getSchool());
        student1.setAcademy(student.getAcademy());
        student1.setGrade(student.getGrade());
        try{
            studentService.updateStudent(student1);
        }catch (Exception e){
            return Result.exception(CodeMsg.HOME_STUDENT_EDITINFO_ERROR);
        }
        session.setAttribute(SessionConstant.STUDENT_SESSION,student1 );
        return Result.success(true);
    }

    @PostMapping("update_image")
    @ResponseBody
    public Result<Boolean> updateImage(Student student,HttpSession session){
       Student student1 =(Student) session.getAttribute(SessionConstant.STUDENT_SESSION);
       student1.setImage(student.getImage());
        try{
            studentService.updateStudent(student1);
        }catch (Exception e){
            return Result.exception(CodeMsg.HOME_STUDENT_EDITINFO_ERROR);
        }
        session.setAttribute(SessionConstant.STUDENT_SESSION,student1 );
        return Result.success(true);
    }

    @PostMapping("edit_pwd")
    @ResponseBody
    public Result<Boolean> editPwd(@RequestParam(value = "oldPwd",required = true) String oldPwd,
                                   @RequestParam(value = "newPwd",required = true) String newPwd,
                                   HttpSession session){
        Student student =(Student) session.getAttribute(SessionConstant.STUDENT_SESSION);
        if(!student.getPassword().equals(oldPwd)){
            return Result.exception(CodeMsg.HOME_STUDENT_EDITPWD_OLD_ERROR);
        }
        student.setPassword(newPwd);
        try{
            studentService.updateStudent(student);
        }catch (Exception e){
            return Result.exception(CodeMsg.HOME_STUDENT_EDITINFO_ERROR);
        }
        session.setAttribute(SessionConstant.STUDENT_SESSION, student);
        return Result.success(true);
    }

    @PostMapping("publish")
    @ResponseBody
    public Result<Boolean> publish(Good good,HttpSession session){
        Student student=(Student)session.getAttribute(SessionConstant.STUDENT_SESSION);
        CodeMsg validata = ValidataUtil.validata(good);
        if(validata.getCode()!=CodeMsg.SUCCESS.getCode()){
            return Result.exception(validata);
        }
        if(good.getCategoryId() == null  || good.getCategoryId() == -1){
            return Result.exception(CodeMsg.HOME_STUDENT_PUBLISH_CATEGORY_EMPTY);
        }
        good.setStudentId(student.getId());
        try {
            goodService.saveGood(good);
        }catch (Exception e){
            return Result.exception(CodeMsg.HOME_STUDENT_PUBLISH_ERROR);
        }
        return Result.success(true);
    }

    @GetMapping("edit")
    public String edit(@RequestParam(value = "id",required = true) Integer id,Model model){
        Good good = goodService.selectGoodById(id);
        if(StringUtils.isEmpty(good)){
            return "/error/runtime_error";
        }
        Category category = categoryService.selectCategoryById(good.getCategoryId());
        model.addAttribute("categorys",category );
        model.addAttribute("goods",good );
        return "home/student/edit_goods";
    }

    @PostMapping("edit")
    @ResponseBody
    public Result<Boolean> edit(Good good){
        if(!ValidataUtil.isNumberObject(good.getPrice())){
            return Result.exception(CodeMsg.HOME_PUBLISH_PRICE_ERROR);
        }
        CodeMsg validata = ValidataUtil.validata(good);
        if(validata.getCode() != CodeMsg.SUCCESS.getCode()){
            return Result.exception(validata);
        }
        if(good.getCategoryId() == null  || good.getCategoryId() == -1){
            return Result.exception(CodeMsg.HOME_STUDENT_PUBLISH_CATEGORY_EMPTY);
        }
        if(StringUtils.isEmpty(goodService.selectGoodById(good.getId()))){
            return Result.exception(CodeMsg.HOME_STUDENT_GOODS_NO_EXIST);
        }

        try {
            goodService.updateGood(good);
        }catch (Exception e){
            return Result.exception(CodeMsg.HOME_STUDENT_GOODS_EDIT_ERROR);
        }
        return Result.success(true);
    }

    @PostMapping("update_status")
    @ResponseBody
    public Result<Boolean> updateStatus(Good good){
        if(StringUtils.isEmpty(goodService.selectGoodById(good.getId()))){
            return Result.exception(CodeMsg.HOME_STUDENT_GOODS_NO_EXIST);
        }
        goodService.updateGood(good);
        return Result.success(true);
    }

    @PostMapping("count")
    @ResponseBody
    public Result<Map<String,Integer>> count(HttpSession session){
        Student student=(Student)session.getAttribute(SessionConstant.STUDENT_SESSION);
        Map<String,Integer> map=new HashMap<>();
        List<Good> goods = goodService.selectGoodsBySid(student.getId());
        Integer goodsTotal=goodService.countGoodBySid(student.getId());
        Integer soldGoodsTotal = 0;
        Integer downGoodsTotal = 0;
        Integer upGoodsTotal = 0;
        for (Good good:goods){
            if(good.getStatus()==Good.GOOD_STATUS_UP){
                upGoodsTotal++;
            }else if (good.getStatus()==Good.GOOD_STATUS_DOWN){
                downGoodsTotal++;
            }else if(good.getStatus()==Good.GOOD_STATUS_SOLD){
                soldGoodsTotal++;
            }
        }
        map.put("goodsTotal", goodsTotal);
        map.put("soldGoodsTotal", soldGoodsTotal);
        map.put("downGoodsTotal", downGoodsTotal);
        map.put("upGoodsTotal", upGoodsTotal);
        map.put("userCart", redisTemplate.opsForHash().size("cart:" + student.getId()).intValue());
        return Result.success(map);
    }

    @PostMapping("comment")
    @ResponseBody
    public Result<Boolean>  comment(HttpSession session,Comment comment){
        CodeMsg validata = ValidataUtil.validata(comment);
        if(validata.getCode()!=CodeMsg.SUCCESS.getCode()){
            return Result.exception(validata);
        }
        if(StringUtils.isEmpty(comment.getGoodId())){
            return Result.exception(CodeMsg.HOME_STUDENT_GOODS_NO_EXIST);
        }
        Student student=(Student)session.getAttribute(SessionConstant.STUDENT_SESSION);
        comment.setStudentId(student.getId());
        commentService.saveComment(comment);
        return Result.success(true);
    }

    @PostMapping("add_cart")
    @ResponseBody
    public Result<Boolean> addCart(@RequestParam("goodId") Integer gid,@RequestParam("studentId") Integer sid){
        String goodId = Integer.toString(gid);
        if(redisTemplate.opsForHash().hasKey("cart:"+sid,goodId )) {
            return Result.exception(CodeMsg.HOME_STUDENT_CART_GOOD_EXIST);
        }
        redisTemplate.opsForHash().put("cart:"+sid,goodId,goodId);
        return Result.success(true);
    }

    @GetMapping("cart")
    public String cart(HttpSession session,Model model){
        Student student=(Student)session.getAttribute(SessionConstant.STUDENT_SESSION);
        List<Object> values = redisTemplate.opsForHash().values("cart:" + student.getId());
        List<Good> list=new ArrayList<>();
        for(Object value:values){
            list.add(goodService.selectGoodById(Integer.parseInt(value.toString())));
        }
        model.addAttribute("goodsList", list);
        return "/home/cart/list";
    }
}
