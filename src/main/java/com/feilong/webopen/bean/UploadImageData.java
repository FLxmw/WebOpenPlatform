package com.feilong.webopen.bean;

import java.io.Serializable;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/13 9:56
 */
@SuppressWarnings("ALL")
public class UploadImageData implements Serializable {
    private int code;
    private String msg;
    private Object data;

    public UploadImageData() {
    }

    public UploadImageData(int code, String msg, Object data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "UploadImageData{" +
                "code=" + code +
                ", msg='" + msg + '\'' +
                ", data=" + data +
                '}';
    }
}
