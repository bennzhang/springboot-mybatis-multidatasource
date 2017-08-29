package com.bennzhang.springboot.springbootmybatisdemo.service;

import com.bennzhang.springboot.springbootmybatisdemo.domain.db2.Country;
import com.bennzhang.springboot.springbootmybatisdemo.mapper.db2.CountryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/rest/db2")
public class CountryService {
    @Autowired
    private CountryMapper countryMapper;

    @GetMapping("/country")
    public List<Country> getAll() { return countryMapper.getCountries();}
}
