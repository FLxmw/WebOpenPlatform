package com.feilong.webopen.bean;

import java.io.Serializable;

/**
 * 返回文章的具体内容
 *
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/14 11:52
 */
@SuppressWarnings("ALL")
public class ContentData implements Serializable {
    private String content;

    public ContentData() {
    }

    public ContentData(String content) {
        this.content = content;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "ContentData{" +
                "content='" + content + '\'' +
                '}';
    }
}
