package com.feilong.webopen.bean;

import java.util.List;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/12 23:01
 */
@SuppressWarnings("ALL")
public class ImageData {
    private String title;
    private String id;
    private Integer start;
    private long count;
    private List data;

    public ImageData() {
    }

    public ImageData(String title, String id, Integer start, long count, List data) {
        this.title = title;
        this.id = id;
        this.start = start;
        this.count = count;
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

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public List getData() {
        return data;
    }

    public void setData(List data) {
        this.data = data;
    }

    public long getCount() {
        return count;
    }

    public void setCount(long count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "ImageData{" +
                "title='" + title + '\'' +
                ", id='" + id + '\'' +
                ", start=" + start +
                ", count=" + count +
                ", data=" + data +
                '}';
    }
}
