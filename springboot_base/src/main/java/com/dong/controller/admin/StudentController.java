package com.dong.controller.admin;

import com.dong.config.TitleConfig;
import com.dong.exception.CodeMsg;
import com.dong.exception.Result;
import com.dong.pojo.Student;
import com.dong.service.StudentService;
import com.dong.vo.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("admin/student")
public class StudentController {

    @Autowired
    private TitleConfig titleConfig;

    @Autowired
    private StudentService studentService;

    @GetMapping("list")
    public String list(PageResult pageResult, @RequestParam(value = "sno",required = false,defaultValue = "") String sno, Model model){
        model.addAttribute("title",titleConfig.getStudentTitle() );
        model.addAttribute("pageResult", studentService.selectPage(pageResult, sno));
        model.addAttribute("sno",sno );
       return "admin/student/list";
    }

    @PutMapping("update_status")
    @ResponseBody
    public Result<Boolean> updateStatus(Student student){
        if(StringUtils.isEmpty(student)){
            return Result.exception(CodeMsg.ADMIN_STUDENT_NO_EXIST);
        }

        if(student.getStatus() != Student.STUDENT_STATUS_ENABLE && student.getStatus() != Student.STUDENT_STATUS_UNENABLE){
            return Result.exception(CodeMsg.ADMIN_STUDENT_STATUS_ERROR);
        }
        try {
            studentService.updateStudent(student);
        }catch (Exception e){
            return Result.exception(CodeMsg.ADMIN_STUDENT_EDIT_ERROR);
        }
         return Result.success(true);
    }

    @DeleteMapping("delete")
    @ResponseBody
    public Result<Boolean> delete(@RequestParam(value = "id") Integer id){
        try {
            studentService.deleteStudent(id);
        }catch (Exception e){
            return Result.exception(CodeMsg.ADMIN_STUDENT_DELETE_ERROR);
        }
        return Result.success(true);
    }
}
