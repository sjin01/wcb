package com.wcb.controllers.basicdata;

import com.jfinal.aop.Before;
import com.wcb.base.BaseController;
import com.wcb.interceptor.manage.ManageLoginInterceptor;
import com.wcb.model.Dict;

/**
 * 收费标准 控制器
 */
@Before(ManageLoginInterceptor.class)
public class ChargeStandard extends BaseController {

    public void index() {
        setAttr("waterStandard", Dict.dao.getChargeStandardForWater());
        render("main.html");
    }

    public void save() {
        Dict.dao.setChargeStandardForWater(getPara("waterStandard"));
        redirect("/basicdata/chargeStandard");
    }
}
