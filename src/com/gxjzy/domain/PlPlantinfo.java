package com.gxjzy.domain;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class PlPlantinfo {

    private int id;//植物ID
    private String plantno;//植物编号
    private String plantname;//植物名称
    private String plantalias;//植物别名
    private String latiname;//拉丁名
    private String gsno;//所属类别
    private String morchar;//形态特征
    private String prodarea;//产地分布
    private String ecolhabit;//生态习性
    private String gardenuse;//用途
    private String imagepath;//图片路径
    private String dimencode;//二维码
    private String addtime;//发布时间
    private String modtime;//修改时间
    private String username;//发布者
    private boolean isstate;//是否发布
    private String remark;//备注
    private String gsname;//属类名称
    private String file;// 文件

    public String getFile() {
        return file;
    }

    public void setFile(String file) {
        this.file = file;
    }

    public String getGsname() {
        return gsname;
    }

    public void setGsname(String gsname) {
        this.gsname = gsname;
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

    public String getPlantname() {
        return plantname;
    }

    public void setPlantname(String plantname) {
        this.plantname = plantname;
    }

    public String getPlantalias() {
        return plantalias;
    }

    public void setPlantalias(String plantalias) {
        this.plantalias = plantalias;
    }

    public String getLatiname() {
        return latiname;
    }

    public void setLatiname(String latiname) {
        this.latiname = latiname;
    }

    public String getGsno() {
        return gsno;
    }

    public void setGsno(String gsno) {
        this.gsno = gsno;
    }

    public String getMorchar() {
        return morchar;
    }

    public void setMorchar(String morchar) {
        this.morchar = morchar;
    }

    public String getProdarea() {
        return prodarea;
    }

    public void setProdarea(String prodarea) {
        this.prodarea = prodarea;
    }

    public String getEcolhabit() {
        return ecolhabit;
    }

    public void setEcolhabit(String ecolhabit) {
        this.ecolhabit = ecolhabit;
    }

    public String getGardenuse() {
        return gardenuse;
    }

    public void setGardenuse(String gardenuse) {
        this.gardenuse = gardenuse;
    }

    public String getImagepath() {
        return imagepath;
    }

    public void setImagepath(String imagepath) {
        this.imagepath = imagepath;
    }

    public String getDimencode() {
        return dimencode;
    }

    public void setDimencode(String dimencode) {
        this.dimencode = dimencode;
    }

    public String getAddtime() {
        SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:ss:mm");
        if(addtime!=null && !addtime.equals("")){
            try {
                Date parse=sf.parse(addtime);
                return sf.format(parse);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return null;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public boolean isIsstate() {
        return isstate;
    }

    public void setIsstate(boolean isstate) {
        this.isstate = isstate;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
