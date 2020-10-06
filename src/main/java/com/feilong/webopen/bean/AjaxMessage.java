package com.feilong.webopen.bean;

import java.io.Serializable;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/6 17:03
 * 前端页面用到的所有ajax返回结果统一封装
 */
@SuppressWarnings("ALL")
public class AjaxMessage implements Serializable {

    private boolean status;
    private String message;
    private Object result;

    public AjaxMessage() {
    }

    public AjaxMessage(boolean status, String message) {
        this.status = status;
        this.message = message;
    }

    public AjaxMessage(boolean status, String message, Object result) {
        this.status = status;
        this.message = message;
        this.result = result;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getResult() {
        return result;
    }

    public void setResult(Object result) {
        this.result = result;
    }
}
