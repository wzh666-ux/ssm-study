package com.gxjzy.domain;

public class PlUserinfo {
    private int id;
    private String username;
    private String password;
    private boolean usex;
    private String unitauth;
    private boolean isactive;
    private String addtime;
    private String modtime;
    private String remark;
    private int role;
    private String department;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isUsex() {
        return usex;
    }

    public void setUsex(boolean usex) {
        this.usex = usex;
    }

    public String getUnitauth() {
        return unitauth;
    }

    public void setUnitauth(String unitauth) {
        this.unitauth = unitauth;
    }

    public boolean isIsactive() {
        return isactive;
    }

    public void setIsactive(boolean isactive) {
        this.isactive = isactive;
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }

    public String getModtime() {
        return modtime;
    }

    public void setModtime(String modtime) {
        this.modtime = modtime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }
}
