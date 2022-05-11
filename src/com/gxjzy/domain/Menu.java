package com.gxjzy.domain;

import java.util.ArrayList;
import java.util.List;

public class Menu {
    private int id; // 菜单id
    private int pid;// 父菜单ID
    private String title;//菜单名称
    private String href; //菜单地址
    private String icon; //菜单图标
    private String target;// 菜单打开的方式
    private List<Menu> child = new ArrayList<>();  //子菜单

    //无参构造函数
    public Menu() {
    }

    public Menu(int id, int pid, String title, String href, String icon, String target, List<Menu> child) {
        this.id = id;
        this.pid = pid;
        this.title = title;
        this.href = href;
        this.icon = icon;
        this.target = target;
        this.child = child;
    }

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

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public List<Menu> getChild() {
        return child;
    }

    public void setChild(List<Menu> child) {
        this.child = child;
    }
}
