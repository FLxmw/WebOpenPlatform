package com.feilong.webopen.bean;

import java.io.Serializable;
import java.util.List;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/13 11:54
 * 相册返回的json数据
 */
@SuppressWarnings("ALL")
public class PhotosData implements Serializable {
    private String title;
    //图片ul标签的id属性值
    private String id;
    private int start;
    private List data;

    public PhotosData() {
    }

    public PhotosData(String title, String id, Integer start, List data) {
        this.title = title;
        this.id = id;
        this.start = start;
        this.data = data;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public List getData() {
        return data;
    }

    public void setData(List data) {
        this.data = data;
    }

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    @Override
    public String toString() {
        return "PhotosData{" +
                "title='" + title + '\'' +
                ", id='" + id + '\'' +
                ", start=" + start +
                ", data=" + data +
                '}';
    }
}
