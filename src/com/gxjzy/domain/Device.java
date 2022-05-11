package com.gxjzy.domain;

public class Device {

    private int id;
    private String name;
    private String type;
    private String username;
    private int jine;
    private boolean isweihu;
    private String remark;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    public boolean getIsweihu(){return isweihu;}

    public void setIsweihu(boolean isweihu){this.isweihu = isweihu;}

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getJine() {
        return jine;
    }

    public void setJine(int jine) {
        this.jine = jine;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
