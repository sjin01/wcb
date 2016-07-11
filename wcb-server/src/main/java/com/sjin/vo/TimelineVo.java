package com.sjin.vo;

import java.util.List;

/**
 * Description:
 * 创建日期: 6/11  15:54
 *
 * @author: guanshj QQ: 928990049
 */
public class TimelineVo {

    private Integer id;

    private String year;

    private String date;
    private String txt;
    private String version;

    List<String> moreTxt ;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTxt() {
        return txt;
    }

    public void setTxt(String txt) {
        this.txt = txt;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public List<String> getMoreTxt() {
        return moreTxt;
    }

    public void setMoreTxt(List<String> moreTxt) {
        this.moreTxt = moreTxt;
    }
}
