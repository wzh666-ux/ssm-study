package com.gxjzy.domain;

public class PlDynamicinfo {

    private int id;
    private String plantno;
    private String basicstate;
    private boolean isill;
    private String checktime;
    private String checker;
    private boolean ismove;
    private String longitude;
    private String latitude;
    private String remark;
    private String addr;//植物的详细地址

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPlantno() {
        return plantno;
    }

    public void setPlantno(String plantno) {
        this.plantno = plantno;
    }

    public String getBasicstate() {
        return basicstate;
    }

    public void setBasicstate(String basicstate) {
        this.basicstate = basicstate;
    }

    public boolean isIsill() {
        return isill;
    }

    public void setIsill(boolean isill) {
        this.isill = isill;
    }

    public String getChecktime() {
        return checktime;
    }

    public void setChecktime(String checktime) {
        this.checktime = checktime;
    }

    public String getChecker() {
        return checker;
    }

    public void setChecker(String checker) {
        this.checker = checker;
    }

    public boolean isIsmove() {
        return ismove;
    }

    public void setIsmove(boolean ismove) {
        this.ismove = ismove;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
