package com.wcb.controllers.common;

import com.jfinal.aop.Before;
import com.wcb.base.BaseController;
import com.wcb.interceptor.manage.NodeInterceptor;
import com.wcb.model.Func;
import com.wcb.model.ProvCityAreaStreet;

/**
 * Description:
 * 创建日期: 5/6  14:11
 * @author: guanshj QQ: 928990049
 */
public class CommonController extends BaseController {

    @Before(NodeInterceptor.class)
    public void nav() {
        setAttr("nav", Func.dao.getNav());
        render("_nav.html");
    }

    @Before(NodeInterceptor.class)
    public void breadcrumbs() {
        render("_breadcrumbs.html");
    }

    /**
     * ProvCityAreaStreet BEGIN ...
     */
    public void getProv() {
        renderJson(getSuccessfulResultMap(ProvCityAreaStreet.dao.getProv()));
    }

    public void getCity() {
        renderJson(getSuccessfulResultMap(ProvCityAreaStreet.dao.getCity(getParaToInt())));
    }

    public void getArea() {
        renderJson(getSuccessfulResultMap(ProvCityAreaStreet.dao.getArea(getParaToInt())));
    }

    public void getStreet() {
        renderJson(getSuccessfulResultMap(ProvCityAreaStreet.dao.getStreet(getParaToInt())));
    }
    //  ProvCityAreaStreet END ...
}
