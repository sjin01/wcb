package com.wcb.model.base;

import com.jfinal.plugin.activerecord.IBean;
import com.jfinal.plugin.activerecord.Model;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseRecordSurvey<M extends BaseRecordSurvey<M>> extends Model<M> implements IBean {

	public void setId(Integer id) {
		set("id", id);
	}

	public Integer getId() {
		return get("id");
	}

	public void setAccountid(Integer accountid) {
		set("accountid", accountid);
	}

	public Integer getAccountid() {
		return get("accountid");
	}

	public void setEquipmentid(Integer equipmentid) {
		set("equipmentid", equipmentid);
	}

	public Integer getEquipmentid() {
		return get("equipmentid");
	}

	public void setType(Integer type) {
		set("type", type);
	}

	public Integer getType() {
		return get("type");
	}

	public void setValue(Double value) {
		set("value", value);
	}

	public Double getValue() {
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

}
