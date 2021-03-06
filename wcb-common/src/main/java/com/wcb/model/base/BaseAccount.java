package com.wcb.model.base;

import com.jfinal.plugin.activerecord.IBean;
import com.jfinal.plugin.activerecord.Model;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseAccount<M extends BaseAccount<M>> extends Model<M> implements IBean {

	public void setId(Integer id) {
		set("id", id);
	}

	public Integer getId() {
		return get("id");
	}

	public void setCode(String code) {
		set("code", code);
	}

	public String getCode() {
		return get("code");
	}

	public void setName(String name) {
		set("name", name);
	}

	public String getName() {
		return get("name");
	}

	public void setAddr(String addr) {
		set("addr", addr);
	}

	public String getAddr() {
		return get("addr");
	}

	public void setProvince(Integer province) {
		set("province", province);
	}

	public Integer getProvince() {
		return get("province");
	}

	public void setCity(Integer city) {
		set("city", city);
	}

	public Integer getCity() {
		return get("city");
	}

	public void setArea(Integer area) {
		set("area", area);
	}

	public Integer getArea() {
		return get("area");
	}

	public void setStreet(Integer street) {
		set("street", street);
	}

	public Integer getStreet() {
		return get("street");
	}

	public void setCommunity(Integer community) {
		set("community", community);
	}

	public Integer getCommunity() {
		return get("community");
	}

	public void setCommunityname(String communityname) {
		set("communityname", communityname);
	}

	public String getCommunityname() {
		return get("communityname");
	}

	public void setRidgepole(String ridgepole) {
		set("ridgepole", ridgepole);
	}

	public String getRidgepole() {
		return get("ridgepole");
	}

	public void setHousehold(String household) {
		set("household", household);
	}

	public String getHousehold() {
		return get("household");
	}

	public void setPeoplenumber(Integer peoplenumber) {
		set("peoplenumber", peoplenumber);
	}

	public Integer getPeoplenumber() {
		return get("peoplenumber");
	}

	public void setCard(String card) {
		set("card", card);
	}

	public String getCard() {
		return get("card");
	}

	public void setDistid(Integer distid) {
		set("distid", distid);
	}

	public Integer getDistid() {
		return get("distid");
	}

}
