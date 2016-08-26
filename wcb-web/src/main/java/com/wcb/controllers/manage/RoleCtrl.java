package com.wcb.controllers.manage;

import com.jfinal.core.Controller;
import com.mysql.jdbc.StringUtils;
import com.wcb.constant.SysConstant;
import com.wcb.model.Role;

/**
 * Description : 角色管理 控制器
 * Author : sJin
 * Date : 2016/8/26
 */
public class RoleCtrl extends Controller{

    public void index (){
        String cPage = getPara("cPage");
        setAttr("roleData" , Role.dao.paginate(StringUtils.isNullOrEmpty(cPage)?1:Integer.valueOf(cPage), SysConstant.MANAGE_PAGESIZE ));
        render("list.html");
    }

    public void add(){
        render("_add.html");
    }

    public void save(){
        Role role = getModel(Role.class);
        role.save();
        redirect("/manage/role");
    }
}
