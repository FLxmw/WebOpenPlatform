package com.feilong.webopen.entity;


import java.io.Serializable;

@SuppressWarnings("ALL")
public class AppInfo implements Serializable {

    private Integer id;
    private String corpName;
    private String appName;
    private String appKey;
    private String appSecret;
    private String redirectUrl;
    private int limit;
    private String description;
    private int cusId;
    private int state;

    public AppInfo() {
    }

    public AppInfo(Integer id, String corpName, String appName, String appKey, String appSecret, String redirectUrl, int limit, String description, int cusId, int state) {
        this.id = id;
        this.corpName = corpName;
        this.appName = appName;
        this.appKey = appKey;
        this.appSecret = appSecret;
        this.redirectUrl = redirectUrl;
        this.limit = limit;
        this.description = description;
        this.cusId = cusId;
        this.state = state;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCorpName() {
        return corpName;
    }

    public void setCorpName(String corpName) {
        this.corpName = corpName;
    }

    public String getAppName() {
        return appName;
    }

    public void setAppName(String appName) {
        this.appName = appName;
    }

    public String getAppKey() {
        return appKey;
    }

    public void setAppKey(String appKey) {
        this.appKey = appKey;
    }

    public String getAppSecret() {
        return appSecret;
    }

    public void setAppSecret(String appSecret) {
        this.appSecret = appSecret;
    }

    public String getRedirectUrl() {
        return redirectUrl;
    }

    public void setRedirectUrl(String redirectUrl) {
        this.redirectUrl = redirectUrl;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCusId() {
        return cusId;
    }

    public void setCusId(int cusId) {
        this.cusId = cusId;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }
}
