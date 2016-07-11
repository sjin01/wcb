package com.sjin.controllers.manage;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.sjin.interceptor.manage.NodeInterceptor;
import com.sjin.model.manage.Func;

/**
 * Description:
 * 创建日期: 5/6  14:11
 *
 * @author: guanshj QQ: 928990049
 */
public class CommonController extends Controller{

    @Before(NodeInterceptor.class)
    public void nav (){
        setAttr("nav" , Func.dao.getNav());
        render("_nav.html");
    }

    @Before(NodeInterceptor.class)
    public void breadcrumbs (){
        render("_breadcrumbs.html");
    }
}
