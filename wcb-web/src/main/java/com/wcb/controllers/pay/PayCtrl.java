package com.wcb.controllers.pay;

import com.jfinal.aop.Before;
import com.mysql.jdbc.StringUtils;
import com.wcb.base.BaseController;
import com.wcb.constant.SysConstant;
import com.wcb.interceptor.manage.ManageLoginInterceptor;
import com.wcb.model.Account;

/**
 * 用户 缴费
 * Created by sJin on 2016/12/26.
 */
@Before(ManageLoginInterceptor.class)
public class PayCtrl extends BaseController {

    public void accountList() {
        String cPage = getPara("cPage");
        setAttr("pageData", Account.dao.paginate(StringUtils.isNullOrEmpty(cPage) ? 1 : Integer.valueOf(cPage), SysConstant.MANAGE_PAGESIZE));
        render("account/list.html");
    }

}
