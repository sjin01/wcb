package com.wcb.controllers.login;

import com.jfinal.aop.Before;
import com.jfinal.render.FreeMarkerRender;
import com.wcb.base.BaseController;
import com.wcb.constant.SysConstant;
import com.wcb.validators.manage.LoginValidator;

/**
 * Description:  登陆页面控制器
 * 创建日期: 4/22  16:25
 * author: sJin
 */
public class LoginController extends BaseController {

    public void index (){
        setAttr(SysConstant.SESSIONKEY_MANAGE_ERROR , getSessionAttr(SysConstant.SESSIONKEY_MANAGE_ERROR));
        render("login.html");
    }

    /**
     * 用户登录
     */
    @Before(LoginValidator.class)
    public void signIn (){
        redirect("/manage/main");  // 重定向到 后台管理 主页
    }

    /**
     * 用户 登出
     */
    public void signOut () {
        setSessionAttr(SysConstant.SESSIONKEY_LOGIN_USER, null);  // 清除Session登陆用户数据
        FreeMarkerRender.getConfiguration().setSharedVariable(SysConstant.SESSIONKEY_LOGIN_USER, null); // 清除Freemarker模板登陆用户数据
        redirect("/manage/main");
    }
}
