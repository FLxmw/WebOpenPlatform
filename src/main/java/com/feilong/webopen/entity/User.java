package com.feilong.webopen.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/11 17:13
 */
@SuppressWarnings("ALL")
public class User implements Serializable {
    private Integer id;
    private String username;
    private String password;
    private String email;
    private String sex;
    private int  state;
    private int grade;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date endtime;
    private String userDesc;

    public User() {
    }

    public User(Integer id, String username, String password, String email, String sex, int state, int grade, Date endtime, String userDesc) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.sex = sex;
        this.state = state;
        this.grade = grade;
        this.endtime = endtime;
       this.userDesc=userDesc;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public String getUserDesc() {
        return userDesc;
    }

    public void setUserDesc(String userDesc) {
        this.userDesc = userDesc;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", sex='" + sex + '\'' +
                ", state=" + state +
                ", grade=" + grade +
                ", endtime=" + endtime +
                ", userDesc='" + userDesc + '\'' +
                '}';
    }
}