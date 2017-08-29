package com.bennzhang.springboot.springbootmybatisdemo.mapper.db1;

import com.bennzhang.springboot.springbootmybatisdemo.domain.db1.Grades;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
public interface GradesMapper {
    @Select("SELECT s.name as studentName, j.name as subjectName, grade FROM students s\n" +
            "JOIN grades ON studentID = sid\n" +
            "JOIN subjects j ON subid = subjectID")
    List<Grades> getStudentsGrades();
}
