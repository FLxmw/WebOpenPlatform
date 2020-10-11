package com.feilong.webopen.bean;

import java.io.Serializable;
import java.util.List;
import java.util.ListResourceBundle;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/11 9:17
 */
@SuppressWarnings("ALL")
public class MenuData<T> implements Serializable {
    private String menu;
    private List<T> menuList;

    public String getMenu() {
        return menu;
    }

    public void setMenu(String menu) {
        this.menu = menu;
    }

    public List<T> getMenuList() {
        return menuList;
    }

    public void setMenuList(List<T> menuList) {
        this.menuList = menuList;
    }
}
