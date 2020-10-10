package com.feilong.webopen.entity;


import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("ALL")
public class Token implements Serializable {

  private Integer id;
  private Integer aid;
  private String accessToken;
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date  expireTime;
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date startTime;


  public Token() {
  }

  public Token(Integer id, Integer aid, String accessToken, Date expireTime, Date startTime) {
    this.id = id;
    this.aid = aid;
    this.accessToken = accessToken;
    this.expireTime = expireTime;
    this.startTime = startTime;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public Integer getAid() {
    return aid;
  }

  public void setAid(Integer aid) {
    this.aid = aid;
  }

  public String getAccessToken() {
    return accessToken;
  }

  public void setAccessToken(String accessToken) {
    this.accessToken = accessToken;
  }

  public Date getExpireTime() {
    return expireTime;
  }

  public void setExpireTime(Date expireTime) {
    this.expireTime = expireTime;
  }

  public Date getStartTime() {
    return startTime;
  }

  public void setStartTime(Date startTime) {
    this.startTime = startTime;
  }

  @Override
  public String toString() {
    return "Token{" +
            "id=" + id +
            ", aid=" + aid +
            ", accessToken='" + accessToken + '\'' +
            ", expireTime=" + expireTime +
            ", startTime=" + startTime +
            '}';
  }
}
