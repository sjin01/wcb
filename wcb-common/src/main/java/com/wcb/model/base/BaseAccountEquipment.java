package com.wcb.model.base;

import com.jfinal.plugin.activerecord.IBean;
import com.jfinal.plugin.activerecord.Model;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseAccountEquipment<M extends BaseAccountEquipment<M>> extends Model<M> implements IBean {

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

	public void setCreatedate(java.util.Date createdate) {
		set("createdate", createdate);
	}

	public java.util.Date getCreatedate() {
		return get("createdate");
	}

	public void setInvaliddate(java.util.Date invaliddate) {
		set("invaliddate", invaliddate);
	}

	public java.util.Date getInvaliddate() {
		return get("invaliddate");
	}

	public void setStatus(Boolean status) {
		set("status", status);
	}

	public Boolean getStatus() {
		return get("status");
	}

}
