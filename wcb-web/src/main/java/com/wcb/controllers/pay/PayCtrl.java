package com.wcb.controllers.pay;

import com.jfinal.aop.Before;
import com.mysql.jdbc.StringUtils;
import com.wcb.base.BaseController;
import com.wcb.constant.SysConstant;
import com.wcb.enums.PayStatusEnum;
import com.wcb.enums.SurveyTypeEnum;
import com.wcb.interceptor.manage.ManageLoginInterceptor;
import com.wcb.model.Account;
import com.wcb.model.RecordPay;
import com.wcb.model.RecordSurvey;
import com.wcb.services.pay.PayService;

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
            Double sumSurveyMoney = PayService.serivce.getSurveySumMoney(accountId);
            Double sumPayMoney = PayService.serivce.getPaySumMoney(accountId);
            Double owe = sumSurveyMoney - sumPayMoney;   // 欠费
            if (owe > 0) {
                setAttr("status", PayStatusEnum.OWE.getCode());
                setAttr("oweMoney", owe / 100);
            } else if (owe < 0) {
                setAttr("status", PayStatusEnum.BALANCE.getCode());
                setAttr("balanceMoney", Math.abs(owe) / 100);
            } else {
                setAttr("status", PayStatusEnum.FINISH.getCode());
            }
        }
        render("main.html");
    }

    public void payList() {
        String cPage = getPara("cPage");
        Integer accountId = getParaToInt("accountid");
        setAttr("accountid", accountId);
        if (accountId != null) {
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

    public void surveyList() {
        String cPage = getPara("cPage");
        Integer accountId = getParaToInt("accountid");
        setAttr("accountid", accountId);
        if (accountId != null) {
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


    public void getAddModal() {
        // type : 1 survey add , 2 pay add
        Integer type = getParaToInt("type");
        setAttr("accountid", getParaToInt("accountid"));

        if (type == 1) {
            render("survey/_add.html");
        } else if (type == 2) {
            setAttr("theorymoney", getParaToInt("theorymoney"));
            render("pay/_add.html");
        }
    }

    public void saveSurvey() {
        RecordSurvey survey = getModel(RecordSurvey.class, "survey");
        try {
            survey.setType(SurveyTypeEnum.WEB.getCode());
            PayService.serivce.saveSurvey(survey);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            redirect("/pay/surveyList?accountid=" + survey.getAccountid());
        }
    }

    public void savePay() {
        RecordPay pay = getModel(RecordPay.class, "pay");
        try {
            PayService.serivce.savePay(pay);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            redirect("/pay/payList?accountid=" + pay.getAccountid());
        }
    }
}
