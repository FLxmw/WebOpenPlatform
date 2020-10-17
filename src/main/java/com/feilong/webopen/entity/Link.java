package com.feilong.webopen.entity;


import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;

/*
 * @ClassName Link
 * @Author FeiLong
 * @Date 2020/10/14
 * 链接实体类
 */

@SuppressWarnings("ALL")
public class Link implements Serializable {

    private Integer id;
    private String logo;
    private String websiteName;
    private String websiteUrl;
    private String masterEmail;
    private String showAddress;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date addTime;

    public Link() {
    }

    public Link(Integer id, String logo, String websiteName, String websiteUrl, String masterEmail, String showAddress, Date addTime) {
        this.id = id;
        this.logo = logo;
        this.websiteName = websiteName;
        this.websiteUrl = websiteUrl;
        this.masterEmail = masterEmail;
        this.showAddress = showAddress;
        this.addTime = addTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getWebsiteName() {
        return websiteName;
    }

    public void setWebsiteName(String websiteName) {
        this.websiteName = websiteName;
    }

    public String getWebsiteUrl() {
        return websiteUrl;
    }

    public void setWebsiteUrl(String websiteUrl) {
        this.websiteUrl = websiteUrl;
    }

    public String getMasterEmail() {
        return masterEmail;
    }

    public void setMasterEmail(String masterEmail) {
        this.masterEmail = masterEmail;
    }

    public String getShowAddress() {
        return showAddress;
    }

    public void setShowAddress(String showAddress) {
        this.showAddress = showAddress;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    @Override
    public String toString() {
        return "Link{" +
                "id=" + id +
                ", logo='" + logo + '\'' +
                ", websiteName='" + websiteName + '\'' +
                ", websiteUrl='" + websiteUrl + '\'' +
                ", masterEmail='" + masterEmail + '\'' +
                ", showAddress='" + showAddress + '\'' +
                ", addTime=" + addTime +
                '}';
    }
}
