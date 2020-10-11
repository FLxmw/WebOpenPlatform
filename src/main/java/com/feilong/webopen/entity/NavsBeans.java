package com.feilong.webopen.entity;

import java.io.Serializable;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/10 22:58
 */
@SuppressWarnings("ALL")
public class NavsBeans implements Serializable {
      private String title;
      private String icon;
      private String href;
      private boolean spread;
      private String target;

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
}
