package com.wcb.enums;

/**
 * Created by sjin on 17/2/22.
 */
public enum SurveyTypeEnum {

    AUTOMATIC(0, "更换设备自动写入"), WEB(1, "平台录入"), MOBILE(2, "移动端现场勘测");

    private Integer code;
    private String name;

    private SurveyTypeEnum(int code, String name) {
        this.code = code;
        this.name = name;
    }

    public String getNameByCode(Integer code) {
        for (SurveyTypeEnum item : SurveyTypeEnum.values()) {
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
