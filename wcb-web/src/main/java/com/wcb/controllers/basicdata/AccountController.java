package com.wcb.controllers.basicdata;

import com.jfinal.aop.Before;
import com.mysql.jdbc.StringUtils;
import com.wcb.base.BaseController;
import com.wcb.constant.SysConstant;
import com.wcb.interceptor.manage.ManageLoginInterceptor;
import com.wcb.model.Account;

/**
 * 用户登记
 * Created by xiao_ on 2016/12/26.
 */
@Before(ManageLoginInterceptor.class)
public class AccountController extends BaseController {

    public void index () {
        String cPage = getPara("cPage");
        setAttr("pageData", Account.dao.paginate(StringUtils.isNullOrEmpty(cPage) ? 1 : Integer.valueOf(cPage), SysConstant.MANAGE_PAGESIZE));
        render("list.html");
    }

    public void add(){
        render("add.html");
    }
    public void edit(){
        Integer id = getParaToInt("id");
        setAttr("account", Account.dao.findById(id));
        render("_edit.html");
    }

    public void save(){
        Account account = getModel(Account.class);
        account.save();
        redirect("/basicdata/account");
    }
}
