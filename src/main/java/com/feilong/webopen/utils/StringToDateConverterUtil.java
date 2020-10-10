package com.feilong.webopen.utils;

import org.springframework.core.convert.converter.Converter;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/10 12:20
 */
@SuppressWarnings("ALL")
public class StringToDateConverterUtil implements Converter<String, Date> {
    @Override
    public Date convert(String str) {
        //判断是否为空
        if (str == null) {
            throw new RuntimeException("日期不能为空！");
        }
        DateFormat ds = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            //将字符串解析成日期类
            Date date = ds.parse(str);
            return date;
        } catch (ParseException e) {
            throw new RuntimeException("类型转换错误！");
        }
    }
}
