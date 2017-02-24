package com.wcb.controllers.pay;

import com.jfinal.aop.Before;
import com.mysql.jdbc.StringUtils;
import com.wcb.base.BaseController;
import com.wcb.constant.SysConstant;
import com.wcb.enums.SurveyTypeEnum;
import com.wcb.interceptor.manage.ManageLoginInterceptor;
import com.wcb.model.Account;
import com.wcb.model.RecordPay;
import com.wcb.model.RecordSurvey;
import com.wcb.services.pay.PayService;
import com.wcb.vo.pay.PayVo;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

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
        String searchStr = getPara("search");
        setAttr("pageData", Account.dao.paginate(StringUtils.isNullOrEmpty(cPage) ? 1 : Integer.valueOf(cPage), SysConstant.MANAGE_PAGESIZE, searchStr));
        render("account/list.html");
    }

    public void main() {
        Integer accountId = getParaToInt("accountid");
        if (accountId != null) {
            setAttr("account", Account.dao.getAccount(accountId));
        }
        render("main.html");
    }

    public void payInfo() {
        Integer accountId = getParaToInt("accountid");
        if (accountId != null) {
            setAttr("payVo", PayService.serivce.getPayVo(accountId));
        }
        render("account/_pay-info.html");
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
        Integer accountId = getParaToInt("accountid");
        setAttr("accountid", accountId);

        if (type == 1) {
            render("survey/_add.html");
        } else if (type == 2) {
            PayVo vo = PayService.serivce.getPayVo(accountId);
            setAttr("theorymoney", vo.getOweMoney() == null ? 0 : vo.getOweMoney());
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

    public void validatePayMoney() {
        String moneyStr = getPara("money");
        try {
            Double money = Double.valueOf(moneyStr);
            if (money > 0) {
                renderJson(true);
            } else {
                renderJson(false);
            }
        } catch (Exception e) {
            e.printStackTrace();
            renderJson(false);
        }
    }

    public void validateSurveyReaddate() {
        String sReaddate = getPara("sReaddate");
        Integer accountId = getParaToInt("accountid");
        try {
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            Date readdate = df.parse(sReaddate);

            RecordSurvey rs = RecordSurvey.dao.getSurveyByAccountIdForFirst(accountId);
            if (rs == null || (readdate.getTime() > rs.getReaddate().getTime())) {
                renderJson(true);
            } else {
                renderJson(false);
            }
        } catch (Exception e) {
            e.printStackTrace();
            renderJson(false);
        }
    }

    public void validateSurveyValue() {
        String value = getPara("sValue");
        Integer accountId = getParaToInt("accountid");
        try {
            Double valueDouble = Double.valueOf(value);
            RecordSurvey rs = RecordSurvey.dao.getSurveyByAccountIdForFirst(accountId);
            if (rs == null || (valueDouble > rs.getValue())) {
                renderJson(true);
            } else {
                renderJson(false);
            }
        } catch (Exception e) {
            e.printStackTrace();
            renderJson(false);
        }
    }
}
