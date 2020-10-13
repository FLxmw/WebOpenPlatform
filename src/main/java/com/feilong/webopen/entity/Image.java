package com.feilong.webopen.entity;

import java.io.Serializable;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/12 23:07
 */
@SuppressWarnings("ALL")
public class Image implements Serializable {
    private Integer id;
    private String src;
    private String thumb;
    private String alt;

    public Image() {
    }

    public Image(Integer id, String src, String thumb, String alt) {
        this.id = id;
        this.src = src;
        this.thumb = thumb;
        this.alt = alt;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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
                "id=" + id +
                ", src='" + src + '\'' +
                ", thumb='" + thumb + '\'' +
                ", alt='" + alt + '\'' +
                '}';
    }
}
