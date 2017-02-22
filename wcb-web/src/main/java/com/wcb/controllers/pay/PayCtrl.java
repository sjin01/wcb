package com.wcb.controllers.pay;

import com.jfinal.aop.Before;
import com.mysql.jdbc.StringUtils;
import com.wcb.base.BaseController;
import com.wcb.constant.SysConstant;
import com.wcb.interceptor.manage.ManageLoginInterceptor;
import com.wcb.model.Account;
import com.wcb.model.RecordPay;
import com.wcb.model.RecordSurvey;

/**
 * 用户 缴费
 * Created by sJin on 2016/12/26.
 */
@Before(ManageLoginInterceptor.class)
public class PayCtrl extends BaseController {

    public void index() {
        redirect("/pay/accountList");
    }

    public void accountList() {
        String cPage = getPara("cPage");
        setAttr("pageData", Account.dao.paginate(StringUtils.isNullOrEmpty(cPage) ? 1 : Integer.valueOf(cPage), SysConstant.MANAGE_PAGESIZE));
        render("account/list.html");
    }

    public void main() {
        Integer accountId = getParaToInt("accountid");
        if (accountId != null) {
            setAttr("account", Account.dao.getAccount(accountId));
        }
        render("main.html");
    }

    public void payList() {
        String cPage = getPara("cPage");
        Integer accountId = getParaToInt("accountid");
        setAttr("accountid", accountId);
        if (accountId != null) {
//            setAttr("account", Account.dao.getAccount(accountId));
            setAttr("pageData",
                    RecordPay.dao.paginate(
                            StringUtils.isNullOrEmpty(cPage) ? 1 : Integer.valueOf(cPage),
                            SysConstant.MANAGE_PAGESIZE,
                            accountId
                    )
            );
        }
        render("pay/list.html");
    }

    public void surveyList (){
        String cPage = getPara("cPage");
        Integer accountId = getParaToInt("accountid");
        setAttr("accountid", accountId);
        if (accountId != null) {
//            setAttr("account", Account.dao.getAccount(accountId));
            setAttr("pageData",
                    RecordSurvey.dao.paginate(
                            StringUtils.isNullOrEmpty(cPage) ? 1 : Integer.valueOf(cPage),
                            SysConstant.MANAGE_PAGESIZE,
                            accountId
                    )
            );
        }
        render("survey/list.html");
    }

}
