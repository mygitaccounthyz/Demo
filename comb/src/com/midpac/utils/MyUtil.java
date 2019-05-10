package com.midpac.utils;

import java.util.Random;

public class MyUtil {

    public static String rand(){
        String ori ="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
        Random random =new Random();
        return ""+ori.charAt(random.nextInt(62))+
                ori.charAt(random.nextInt(62))+
                ori.charAt(random.nextInt(62))+
                ori.charAt(random.nextInt(62));
    }
}
