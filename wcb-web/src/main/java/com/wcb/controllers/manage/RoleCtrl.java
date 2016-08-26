package com.wcb.controllers.manage;

import com.jfinal.core.Controller;
import com.mysql.jdbc.StringUtils;
import com.wcb.constant.SysConstant;

/**
 * Description : 角色管理 控制器
 * Author : sJin
 * Date : 2016/8/26
 */
public class RoleCtrl extends Controller{

    public void index (){
        String cPage = getPara("cPage");
        setAttr("roleData" , null);
        render("list.html");
    }
}
