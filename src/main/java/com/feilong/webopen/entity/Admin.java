package com.feilong.webopen.entity;


import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("ALL")
public class Admin implements Serializable {

  private int id;
  private String username;
  private String password;
  private String email;
  private String sex;
  private int  state;
  private int grade;
  private Date endtime;

  public Admin() {
  }

  public Admin(int id, String username, String password, String email, String sex, int state, int grade, Date endtime) {
    this.id = id;
    this.username = username;
    this.password = password;
    this.email = email;
    this.sex = sex;
    this.state = state;
    this.grade = grade;
    this.endtime = endtime;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
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

  @Override
  public String toString() {
    return "Admin{" +
            "id=" + id +
            ", username='" + username + '\'' +
            ", password='" + password + '\'' +
            ", email='" + email + '\'' +
            ", sex='" + sex + '\'' +
            ", state=" + state +
            ", grade=" + grade +
            ", endtime=" + endtime +
            '}';
  }
}
