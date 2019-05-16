package com.example.ssm_springbootx;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("com.example.ssm_springbootx.dao")
@SpringBootApplication
public class SsmSpringbootxApplication {

    public static void main(String[] args) {
        SpringApplication.run(SsmSpringbootxApplication.class, args);
    }

}
