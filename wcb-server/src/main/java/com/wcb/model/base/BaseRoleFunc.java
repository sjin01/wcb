package com.wcb.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseRoleFunc<M extends BaseRoleFunc<M>> extends Model<M> implements IBean {

	public void setId(java.lang.Integer id) {
		set("id", id);
	}

	public java.lang.Integer getId() {
		return get("id");
	}

	public void setRoleid(java.lang.Integer roleid) {
		set("roleid", roleid);
	}

	public java.lang.Integer getRoleid() {
		return get("roleid");
	}

	public void setFuncid(java.lang.Integer funcid) {
		set("funcid", funcid);
	}

	public java.lang.Integer getFuncid() {
		return get("funcid");
	}

}