package com.wcb.enums;

/**
 * 常用状态枚举
 * Created by sjin on 17/2/21.
 */
public enum StatusEnum {

    NORMAL(1, "正常", true), INVALID(0, "失效", false);

    private Integer code;
    private String name;
    private Boolean falg;

    private StatusEnum(int code, String name, Boolean falg) {
        this.code = code;
        this.name = name;
        this.falg = falg;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean getFalg() {
        return falg;
    }

    public void setFalg(Boolean falg) {
        this.falg = falg;
    }
}
