package com.sjin.controllers.manage;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.render.FreeMarkerRender;
import com.sjin.constant.SysConstant;
import com.sjin.interceptor.manage.ManageLoginInterceptor;
import freemarker.template.TemplateModelException;

/**
 * Description: 后台管理首页
 * 创建日期: 4/22  16:54
 *
 * @author: guanshj QQ: 928990049
 */
@Before(ManageLoginInterceptor.class)
public class ManageIndexController extends Controller {

    public void index () throws TemplateModelException {
//        setAttr( SysConstant.SESSIONKEY_LOGIN_USER , getSessionAttr(SysConstant.SESSIONKEY_LOGIN_USER));
        FreeMarkerRender.getConfiguration().setSharedVariable(SysConstant.SESSIONKEY_LOGIN_USER, getSessionAttr(SysConstant.SESSIONKEY_LOGIN_USER));
        render("manageindex.html");
    }


}
