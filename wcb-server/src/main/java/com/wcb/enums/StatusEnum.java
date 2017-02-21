package com.wcb.enums;

/**
 * 常用状态枚举
 * Created by sjin on 17/2/21.
 */
public enum StatusEnum {

    NORMAL(1, "正常"), INVALID(0, "失效");

    private Integer code;
    private String name;

    private StatusEnum(int code, String name) {
        this.code = code;
        this.name = name;
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
}
