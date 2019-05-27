package com.example.ssm_springbootx;

import org.junit.Test;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SimpleTest {

    @Test
    public void t1(){
        System.out.println(new Timestamp(new java.util.Date().getTime()));
    }

    @Test
    public void t2() throws ParseException {
        System.out.println(new SimpleDateFormat("yyyy-M-d H:m:s").parse("2019-08-08 5:5:5"));

    }
}
