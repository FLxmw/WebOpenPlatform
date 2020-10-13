package com.feilong.webopen.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.UUID;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/10 12:43
 */
public class Maintest {
    public static void main(String[] args) {
        String uuid = UUID.randomUUID().toString().replace("-", "").toUpperCase();
//        System.out.println(uuid);
        String image = "image1.jpg";
        String substring = image.substring(0,image.indexOf("."));
        System.out.println(substring);

    }
}
