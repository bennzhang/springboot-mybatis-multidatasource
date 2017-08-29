package com.bennzhang.springboot.springbootmybatisdemo.service;

import com.bennzhang.springboot.springbootmybatisdemo.domain.db1.Grades;
import com.bennzhang.springboot.springbootmybatisdemo.mapper.db1.GradesMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/rest/db1")
public class GradesService {
    @Autowired
    private GradesMapper gradesMapper;

    @GetMapping("/grades")
    public List<Grades> getAll() {
        return gradesMapper.getStudentsGrades();
    }
}
