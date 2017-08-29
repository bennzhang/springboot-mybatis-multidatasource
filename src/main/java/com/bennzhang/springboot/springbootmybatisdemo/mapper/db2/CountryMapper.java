package com.bennzhang.springboot.springbootmybatisdemo.mapper.db2;

import com.bennzhang.springboot.springbootmybatisdemo.domain.db2.Country;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface CountryMapper {
    @Select("select c.country_id, c.country_name, r.region_name\n" +
            "from countries c join regions r on r.region_id = c.region_id")
    List<Country> getCountries();
}
