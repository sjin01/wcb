package com.wcb.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseRecordSurvey<M extends BaseRecordSurvey<M>> extends Model<M> implements IBean {

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

	public void setEquipmentid(java.lang.Integer equipmentid) {
		set("equipmentid", equipmentid);
	}

	public java.lang.Integer getEquipmentid() {
		return get("equipmentid");
	}

	public void setType(java.lang.Integer type) {
		set("type", type);
	}

	public java.lang.Integer getType() {
		return get("type");
	}

	public void setValue(java.lang.Double value) {
		set("value", value);
	}

	public java.lang.Double getValue() {
		return get("value");
	}

	public void setReaddate(java.util.Date readdate) {
		set("readdate", readdate);
	}

	public java.util.Date getReaddate() {
		return get("readdate");
	}

	public void setCreatedate(java.util.Date createdate) {
		set("createdate", createdate);
	}

	public java.util.Date getCreatedate() {
		return get("createdate");
	}

	public void setUsevalue(java.lang.Double usevalue) {
		set("usevalue", usevalue);
	}

	public java.lang.Double getUsevalue() {
		return get("usevalue");
	}

	public void setMoney(java.lang.Integer money) {
		set("money", money);
	}

	public java.lang.Integer getMoney() {
		return get("money");
	}

}
