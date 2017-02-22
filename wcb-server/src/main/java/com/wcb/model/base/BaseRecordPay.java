package com.wcb.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseRecordPay<M extends BaseRecordPay<M>> extends Model<M> implements IBean {

	public void setId(java.lang.Integer id) {
		set("id", id);
	}

	public java.lang.Integer getId() {
		return get("id");
	}

	public void setAccountid(java.lang.Integer accountid) {
		set("accountid", accountid);
	}

	public java.lang.Integer getAccountid() {
		return get("accountid");
	}

	public void setPaydate(java.util.Date paydate) {
		set("paydate", paydate);
	}

	public java.util.Date getPaydate() {
		return get("paydate");
	}

	public void setMoney(java.lang.Integer money) {
		set("money", money);
	}

	public java.lang.Integer getMoney() {
		return get("money");
	}

	public void setSurveyid(java.lang.Integer surveyid) {
		set("surveyid", surveyid);
	}

	public java.lang.Integer getSurveyid() {
		return get("surveyid");
	}

	public void setStatus(java.lang.Integer status) {
		set("status", status);
	}

	public java.lang.Integer getStatus() {
		return get("status");
	}

	public void setBalance(java.lang.Integer balance) {
		set("balance", balance);
	}

	public java.lang.Integer getBalance() {
		return get("balance");
	}

	public void setTheorymoney(java.lang.Integer theorymoney) {
		set("theorymoney", theorymoney);
	}

	public java.lang.Integer getTheorymoney() {
		return get("theorymoney");
	}

}
