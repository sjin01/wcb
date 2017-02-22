package com.wcb.enums;

/**
 * Created by sjin on 17/2/22.
 */
public enum PayStatusEnum {

    FINISH(1, "缴清"), OWE(2, "欠费"), BALANCE(3, "预存");

    private Integer code;
    private String name;

    private PayStatusEnum(int code, String name) {
        this.code = code;
        this.name = name;
    }

    public String getNameByCode(Integer code) {
        for (PayStatusEnum item : PayStatusEnum.values()) {
            if (item.getCode() == code) {
                return item.getName();
            }
        }
        return null;
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
