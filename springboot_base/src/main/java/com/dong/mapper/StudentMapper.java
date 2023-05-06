package com.dong.mapper;

import com.dong.pojo.Student;

import java.util.List;

public interface StudentMapper {
     Student selectStudent(Student student);

     void saveStudent(Student student);

     void updateStudent(Student student);

     List<Student> selectAllStudent(String sno);

     void deleteStudent(Integer id);

}
