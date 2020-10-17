package com.feilong.webopen.entity;


import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;

/*
 * @ClassName Log
 * @Author FeiLong
 * @Date 2020/10/14
 * 日志类
 */

@SuppressWarnings("ALL")
public class Log implements Serializable {

    private Integer id;
    private String url;
    private String method;
    private String ip;
    private String timeConsuming;
    private String isAbnormal;
    private String operator;
//    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private String  operatingTime;


    public Log() {
    }

    public Log(Integer id, String url, String method, String ip, String timeConsuming, String isAbnormal, String operator, String operatingTime) {
        this.id = id;
        this.url = url;
        this.method = method;
        this.ip = ip;
        this.timeConsuming = timeConsuming;
        this.isAbnormal = isAbnormal;
        this.operator = operator;
        this.operatingTime = operatingTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getTimeConsuming() {
        return timeConsuming;
    }

    public void setTimeConsuming(String timeConsuming) {
        this.timeConsuming = timeConsuming;
    }

    public String getIsAbnormal() {
        return isAbnormal;
    }

    public void setIsAbnormal(String isAbnormal) {
        this.isAbnormal = isAbnormal;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getOperatingTime() {
        return operatingTime;
    }

    public void setOperatingTime(String operatingTime) {
        this.operatingTime = operatingTime;
    }

    @Override
    public String toString() {
        return "Log{" +
                "id=" + id +
                ", url='" + url + '\'' +
                ", method='" + method + '\'' +
                ", ip='" + ip + '\'' +
                ", timeConsuming='" + timeConsuming + '\'' +
                ", isAbnormal='" + isAbnormal + '\'' +
                ", operator='" + operator + '\'' +
                ", operatingTime=" + operatingTime +
                '}';
    }
}
