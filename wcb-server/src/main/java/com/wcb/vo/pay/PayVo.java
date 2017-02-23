package com.wcb.vo.pay;

/**
 * 缴费情况 展示 VO 类
 * Created by sjin on 17/2/23.
 */
public class PayVo {

    private Integer status;      // 当前状态     -> FINISH(1, "缴清"), OWE(2, "欠费"), BALANCE(3, "预存");
    private Double oweMoney; // 当前欠费:单位元
    private Double balanceMoney; // 当前余额:单位元

    private Double sumSurveyMoney; //  总产生费用 金额 单位:元
    private Double sumPayMoney; // 总缴纳金额 单位:元

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Double getOweMoney() {
        return oweMoney;
    }

    public void setOweMoney(Double oweMoney) {
        this.oweMoney = oweMoney;
    }

    public Double getBalanceMoney() {
        return balanceMoney;
    }

    public void setBalanceMoney(Double balanceMoney) {
        this.balanceMoney = balanceMoney;
    }

    public Double getSumSurveyMoney() {
        return sumSurveyMoney;
    }

    public void setSumSurveyMoney(Double sumSurveyMoney) {
        this.sumSurveyMoney = sumSurveyMoney;
    }

    public Double getSumPayMoney() {
        return sumPayMoney;
    }

    public void setSumPayMoney(Double sumPayMoney) {
        this.sumPayMoney = sumPayMoney;
    }
}
