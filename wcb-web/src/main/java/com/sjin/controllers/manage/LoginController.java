package com.sjin.controllers.manage;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.render.FreeMarkerRender;
import com.sjin.constant.SysConstant;
import com.sjin.validators.manage.LoginValidator;

/**
 * Description:  登陆页面控制器
 * 创建日期: 4/22  16:25
 *
 * @author: guanshj QQ: 928990049
 */
public class LoginController extends Controller{

    public void index (){
        setAttr(SysConstant.SESSIONKEY_MANAGE_ERROR , getSessionAttr(SysConstant.SESSIONKEY_MANAGE_ERROR));
        render("login.html");
    }

    /**
     * 用户登录
     */
    @Before(LoginValidator.class)
    public void login (){
        redirect("/manage/main");  // 重定向到 后台管理 主页
    }

    /**
     * 用户 登出
     */
    public void logout () {
        setSessionAttr(SysConstant.SESSIONKEY_LOGIN_USER, null);  // 清除Session登陆用户数据
        FreeMarkerRender.getConfiguration().setSharedVariable(SysConstant.SESSIONKEY_LOGIN_USER, null); // 清除Freemarker模板登陆用户数据
        redirect("/manage/main");
    }
}
