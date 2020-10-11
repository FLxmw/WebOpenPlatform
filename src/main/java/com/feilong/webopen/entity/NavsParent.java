package com.feilong.webopen.entity;

import java.io.Serializable;
import java.util.List;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/10 20:38
 */
@SuppressWarnings("ALL")
public class NavsParent implements Serializable {
    private int id;
    private String menu;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMenu() {
        return menu;
    }

    public void setMenu(String menu) {
        this.menu = menu;
    }


    @Override
    public String toString() {
        return "NavsParent{" +
                "id=" + id +
                ", menu='" + menu + '\'' +
                '}';
    }
}
