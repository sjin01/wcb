package com.wcb.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseAccount<M extends BaseAccount<M>> extends Model<M> implements IBean {

	public void setId(java.lang.Integer id) {
		set("id", id);
	}

	public java.lang.Integer getId() {
		return get("id");
	}

	public void setCode(java.lang.String code) {
		set("code", code);
	}

	public java.lang.String getCode() {
		return get("code");
	}

	public void setName(java.lang.String name) {
		set("name", name);
	}

	public java.lang.String getName() {
		return get("name");
	}

	public void setAddr(java.lang.String addr) {
		set("addr", addr);
	}

	public java.lang.String getAddr() {
		return get("addr");
	}

	public void setProvince(java.lang.Integer province) {
		set("province", province);
	}

	public java.lang.Integer getProvince() {
		return get("province");
	}

	public void setCity(java.lang.Integer city) {
		set("city", city);
	}

	public java.lang.Integer getCity() {
		return get("city");
	}

	public void setArea(java.lang.Integer area) {
		set("area", area);
	}

	public java.lang.Integer getArea() {
		return get("area");
	}

	public void setStreet(java.lang.Integer street) {
		set("street", street);
	}

	public java.lang.Integer getStreet() {
		return get("street");
	}

	public void setCommunity(java.lang.Integer community) {
		set("community", community);
	}

	public java.lang.Integer getCommunity() {
		return get("community");
	}

	public void setCommunityname(java.lang.String communityname) {
		set("communityname", communityname);
	}

	public java.lang.String getCommunityname() {
		return get("communityname");
	}

	public void setRidgepole(java.lang.String ridgepole) {
		set("ridgepole", ridgepole);
	}

	public java.lang.String getRidgepole() {
		return get("ridgepole");
	}

	public void setHousehold(java.lang.String household) {
		set("household", household);
	}

	public java.lang.String getHousehold() {
		return get("household");
	}

	public void setPeoplenumber(java.lang.Integer peoplenumber) {
		set("peoplenumber", peoplenumber);
	}

	public java.lang.Integer getPeoplenumber() {
		return get("peoplenumber");
	}

	public void setCard(java.lang.String card) {
		set("card", card);
	}

	public java.lang.String getCard() {
		return get("card");
	}

	public void setDistid(java.lang.Integer distid) {
		set("distid", distid);
	}

	public java.lang.Integer getDistid() {
		return get("distid");
	}

	public void setSigninDate(java.util.Date signinDate) {
		set("signinDate", signinDate);
	}

	public java.util.Date getSigninDate() {
		return get("signinDate");
	}

	public void setStatus(java.lang.Integer status) {
		set("status", status);
	}

	public java.lang.Integer getStatus() {
		return get("status");
	}

}
