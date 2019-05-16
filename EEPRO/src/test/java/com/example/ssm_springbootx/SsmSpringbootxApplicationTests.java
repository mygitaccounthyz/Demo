package com.example.ssm_springbootx;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Locale;

@RunWith(SpringRunner.class)
@SpringBootTest
public class SsmSpringbootxApplicationTests {

    @Test
    public void contextLoads() {
    }

    @Test
    public void t1(){
        System.out.println("eeId".toUpperCase(Locale.ENGLISH));
    }

}
