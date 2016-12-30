package com.wcb.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.mysql.jdbc.StringUtils;
import com.wcb.model.base.BaseEquipment;

import java.util.List;

/**
 * Generated by JFinal.
 * 水表设备
 */
@SuppressWarnings("serial")
public class Equipment extends BaseEquipment<Equipment> {
	public static final Equipment dao = new Equipment();

	public Page<Equipment> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select * " , " from t_equipment ");
	}

	public void deleteList(String ids){
		if(!StringUtils.isNullOrEmpty(ids)){
			StringBuilder sqlsb = new StringBuilder();
			sqlsb.append("delete from t_equipment where id in ( ");
			sqlsb.append(ids);
			sqlsb.append(" -1) ");
			Db.update(sqlsb.toString());
		}
	}

	public List<Equipment> getEquipmentAll (){
		return dao.find(" select * from t_equipment ");
	}
}
