package com.feilong.webopen.entity;


import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("ALL")
public class News implements Serializable {

    private Integer id;
    private String newsName;
    private String newsAuthor;
    private int newsStatus;
    private String digest;
    private String newsImg;
    private String newsLook;
    private String newsTop;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date newsTime;
    private String content;

    public News() {
    }

    public News(Integer id, String newsName, String newsAuthor, int newsStatus, String digest, String newsImg, String newsLook, String newsTop, Date newsTime, String content) {
        this.id = id;
        this.newsName = newsName;
        this.newsAuthor = newsAuthor;
        this.newsStatus = newsStatus;
        this.digest = digest;
        this.newsImg = newsImg;
        this.newsLook = newsLook;
        this.newsTop = newsTop;
        this.newsTime = newsTime;
        this.content = content;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNewsName() {
        return newsName;
    }

    public void setNewsName(String newsName) {
        this.newsName = newsName;
    }

    public String getNewsAuthor() {
        return newsAuthor;
    }

    public void setNewsAuthor(String newsAuthor) {
        this.newsAuthor = newsAuthor;
    }

    public int getNewsStatus() {
        return newsStatus;
    }

    public void setNewsStatus(int newsStatus) {
        this.newsStatus = newsStatus;
    }

    public String getDigest() {
        return digest;
    }

    public void setDigest(String digest) {
        this.digest = digest;
    }

    public String getNewsImg() {
        return newsImg;
    }

    public void setNewsImg(String newsImg) {
        this.newsImg = newsImg;
    }

    public String getNewsLook() {
        return newsLook;
    }

    public void setNewsLook(String newsLook) {
        this.newsLook = newsLook;
    }

    public String getNewsTop() {
        return newsTop;
    }

    public void setNewsTop(String newsTop) {
        this.newsTop = newsTop;
    }

    public Date getNewsTime() {
        return newsTime;
    }

    public void setNewsTime(Date newsTime) {
        this.newsTime = newsTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "News{" +
                "id=" + id +
                ", newsName='" + newsName + '\'' +
                ", newsAuthor='" + newsAuthor + '\'' +
                ", newsStatus=" + newsStatus +
                ", digest='" + digest + '\'' +
                ", newsImg='" + newsImg + '\'' +
                ", newsLook='" + newsLook + '\'' +
                ", newsTop='" + newsTop + '\'' +
                ", newsTime=" + newsTime +
                ", content='" + content + '\'' +
                '}';
    }
}
