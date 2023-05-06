package com.dong.service;

import com.dong.mapper.StudentMapper;
import com.dong.pojo.Student;
import com.dong.vo.PageResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentService {
    @Autowired
    private StudentMapper studentMapper;

    public Student selectStudent(Student student){
        return studentMapper.selectStudent(student);
    }

    public void saveStuent(Student student){
        studentMapper.saveStudent(student);
    }

    public void updateStudent(Student student) {
        studentMapper.updateStudent(student);
    }

    public PageResult<Student> selectPage(PageResult pageResult,String sno){
        PageHelper.startPage(pageResult.getCurrentPage(),pageResult.getPageSize());
        List<Student> students = studentMapper.selectAllStudent(sno);
        PageInfo pageInfo=new PageInfo(students);
        return new PageResult<>(pageInfo.getPageNum(),pageInfo.getPageSize(),pageInfo.getPages(),pageInfo.getTotal(),students);
    }

    public void deleteStudent(Integer id){
        studentMapper.deleteStudent(id);
    }
}
