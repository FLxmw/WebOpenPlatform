package com.feilong.webopen.entity;

import java.io.Serializable;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/12 23:07
 */
@SuppressWarnings("ALL")
public class Image implements Serializable {
    private Integer pid;
    private String src;
    private String thumb;
    private String alt;

    public Image() {
    }

    public Image(Integer pid, String src, String thumb, String alt) {
        this.pid = pid;
        this.src = src;
        this.thumb = thumb;
        this.alt = alt;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public String getThumb() {
        return thumb;
    }

    public void setThumb(String thumb) {
        this.thumb = thumb;
    }

    public String getAlt() {
        return alt;
    }

    public void setAlt(String alt) {
        this.alt = alt;
    }

    @Override
    public String toString() {
        return "Image{" +
                "pid=" + pid +
                ", src='" + src + '\'' +
                ", thumb='" + thumb + '\'' +
                ", alt='" + alt + '\'' +
                '}';
    }
}
