package com.bennzhang.springboot.springbootmybatisdemo;

import com.bennzhang.springboot.springbootmybatisdemo.domain.db1.Grades;
import org.apache.ibatis.type.MappedTypes;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("com.bennzhang.springboot.springbootmybatisdemo.mapper")
@SpringBootApplication
public class SpringbootMybatisDemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringbootMybatisDemoApplication.class, args);
	}
}
