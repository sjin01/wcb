package com.wcb.model;

import com.jfinal.plugin.activerecord.Page;
import com.wcb.model.base.BaseAccount;

/**
 * Generated by JFinal.
 * 水表账户
 */
@SuppressWarnings("serial")
public class Account extends BaseAccount<Account> {
	public static final Account dao = new Account();

	/**
	 * 分页
	 */
	public Page<Account> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select * " , " from t_account order by id desc");
	}
}
