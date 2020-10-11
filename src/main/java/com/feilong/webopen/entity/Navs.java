package com.feilong.webopen.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.io.Serializable;
import java.util.List;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/10 19:51
 * 这是统一返回的导航Json数据
 */
@SuppressWarnings("ALL")
public class Navs implements Serializable {
    //返回json数据时忽略此属性
    @JsonIgnore
    private int id;
    @JsonIgnore
    private int  pid;
    private String title;
    private String icon;
    private String href;
    private boolean spread;
    private String target;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public boolean isSpread() {
        return spread;
    }

    public void setSpread(boolean spread) {
        this.spread = spread;
    }


    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    @Override
    public String toString() {
        return "Navs{" +
                "title='" + title + '\'' +
                ", icon='" + icon + '\'' +
                ", href='" + href + '\'' +
                ", spread=" + spread +
                ", target='" + target + '\'' +
                '}';
    }
}
