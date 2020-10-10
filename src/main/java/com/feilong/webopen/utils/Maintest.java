package com.feilong.webopen.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/10 12:43
 */
public class Maintest {
    public static void main(String[] args) {
        long l = System.currentTimeMillis();
        DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String format = dateFormat.format(l*2);
        System.out.println(l);
        System.out.println(format);
    }
}
