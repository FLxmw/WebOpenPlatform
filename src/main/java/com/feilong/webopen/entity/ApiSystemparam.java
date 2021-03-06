package com.feilong.webopen.entity;

import java.io.Serializable;

/**
 * 系统参数管理
 */
@SuppressWarnings("ALL")
public class ApiSystemparam implements Serializable {

    private Integer id;
    private String netName;
    private String version;
    private String description;
    private String author;
    private String homePage;
    private String serverEn;
    private String dbVersion;
    private String maxUpload;
    private String userLimit;
    private String powerby;
    private String record;

    public ApiSystemparam() {
    }

    public ApiSystemparam(Integer id, String netName, String version, String description, String author, String homePage, String serverEn, String dbVersion, String maxUpload, String userLimit, String powerby, String record) {
        this.id = id;
        this.netName = netName;
        this.version = version;
        this.description = description;
        this.author = author;
        this.homePage = homePage;
        this.serverEn = serverEn;
        this.dbVersion = dbVersion;
        this.maxUpload = maxUpload;
        this.userLimit = userLimit;
        this.powerby = powerby;
        this.record = record;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNetName() {
        return netName;
    }

    public void setNetName(String netName) {
        this.netName = netName;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getHomePage() {
        return homePage;
    }

    public void setHomePage(String homePage) {
        this.homePage = homePage;
    }

    public String getServerEn() {
        return serverEn;
    }

    public void setServerEn(String serverEn) {
        this.serverEn = serverEn;
    }

    public String getDbVersion() {
        return dbVersion;
    }

    public void setDbVersion(String dbVersion) {
        this.dbVersion = dbVersion;
    }

    public String getMaxUpload() {
        return maxUpload;
    }

    public void setMaxUpload(String maxUpload) {
        this.maxUpload = maxUpload;
    }

    public String getUserLimit() {
        return userLimit;
    }

    public void setUserLimit(String userLimit) {
        this.userLimit = userLimit;
    }

    public String getPowerby() {
        return powerby;
    }

    public void setPowerby(String powerby) {
        this.powerby = powerby;
    }

    public String getRecord() {
        return record;
    }

    public void setRecord(String record) {
        this.record = record;
    }

    @Override
    public String toString() {
        return "ApiSystemparam{" +
                "id=" + id +
                ", netName='" + netName + '\'' +
                ", version='" + version + '\'' +
                ", description='" + description + '\'' +
                ", author='" + author + '\'' +
                ", homePage='" + homePage + '\'' +
                ", serverEn='" + serverEn + '\'' +
                ", dbVersion='" + dbVersion + '\'' +
                ", maxUpload='" + maxUpload + '\'' +
                ", userLimit='" + userLimit + '\'' +
                ", powerby='" + powerby + '\'' +
                ", record='" + record + '\'' +
                '}';
    }
}
