package com.wcb.model;

import com.jfinal.plugin.activerecord.Page;
import com.wcb.model.base.BaseRole;

/**
 * Generated by JFinal.
 * 操作员角色
 */
@SuppressWarnings("serial")
public class Role extends BaseRole<Role> {
	public static final Role dao = new Role();

	public Page<Role> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select * " , " from t_sys_role order by sort ");
	}
}
