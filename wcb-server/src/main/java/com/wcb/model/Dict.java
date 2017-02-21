package com.wcb.model;

import com.jfinal.plugin.activerecord.Page;
import com.wcb.constant.SysConstant;
import com.wcb.model.base.BaseDict;

/**
 * Generated by JFinal.
 * 数据字典
 */
@SuppressWarnings("serial")
public class Dict extends BaseDict<Dict> {
    public static final Dict dao = new Dict();

    public Page<Dict> paginate(int pageNumber, int pageSize) {
        return paginate(pageNumber, pageSize, "select * ", " from t_sys_dict order by sort asc");
    }

    public Double getChargeStandardForWater() {
        Dict dict = dao.findFirst("select * from t_sys_dict where type = ? ", SysConstant.CHARGE_STANDARD_FOR_WATER);
        if (dict != null) {
            return Double.valueOf(dict.getName());
        } else {
            return null;
        }
    }

    public void setChargeStandardForWater(String val) {
        Dict dict = dao.findFirst("select * from t_sys_dict where type = ? ", SysConstant.CHARGE_STANDARD_FOR_WATER);
        if (dict != null) {
            dict.setName(val);
            dict.update();
        } else {
            dict = new Dict();
            dict.setName(val);
            dict.setType(SysConstant.CHARGE_STANDARD_FOR_WATER);
            dict.save();
        }
    }
}
