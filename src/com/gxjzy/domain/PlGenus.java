package com.gxjzy.domain;

public class PlGenus {

    /**
     * 属类id
     */
    private int id;
    /**
     * 属类编号
     */
    private String gsno;
    /**
     * 属类名称
     */
    private String gsname;
    /**
     * 所属科类编号
     */
    private String cyno;
    /**
     * 所属科类名称
     */
    private String cyname;
    /**
     * 备注
     */
    private String remark;

    public String getCyname() {
        return cyname;
    }

    public void setCyname(String cyname) {
        this.cyname = cyname;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGsno() {
        return gsno;
    }

    public void setGsno(String gsno) {
        this.gsno = gsno;
    }

    public String getGsname() {
        return gsname;
    }

    public void setGsname(String gsname) {
        this.gsname = gsname;
    }

    public String getCyno() {
        return cyno;
    }

    public void setCyno(String cyno) {
        this.cyno = cyno;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
