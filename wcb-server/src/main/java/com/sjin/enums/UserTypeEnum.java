package com.sjin.enums;

/**
 * Description:
 * 创建日期: 4/24  9:48
 * @author: guanshj QQ: 928990049
 */
public enum  UserTypeEnum {

    USER(0,"普通用户"),ADMIN(520 ,"管理员"),SUPERADMIN(999 ,"超级管理员");

    private Integer code;
    private String message;

    private UserTypeEnum(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public Integer getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }
}
