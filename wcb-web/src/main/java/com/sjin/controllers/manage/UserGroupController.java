package com.sjin.controllers.manage;

import com.jfinal.aop.Before;
import com.mysql.jdbc.StringUtils;
import com.sjin.base.BaseController;
import com.sjin.constant.SysConstant;
import com.sjin.interceptor.manage.ManageLoginInterceptor;
import com.sjin.model.manage.UserGroup;

/**
 * Description:  用户组 管理
 * 创建日期: 6/6  16:30
 *
 * @author: guanshj QQ: 928990049
 */
@Before(ManageLoginInterceptor.class)
public class UserGroupController extends BaseController {

    public void index () {
        String cPage = getPara("cPage");
        setAttr("usergroupdata" , UserGroup.dao.paginate( StringUtils.isNullOrEmpty(cPage)?1:Integer.valueOf(cPage), SysConstant.MANAGE_PAGESIZE ));
        render("list.html");
    }

    public void delete(){
        UserGroup.dao.deleteById(getParaToInt("id"));
        redirect("/manage/usergroup?cPage=" + getPara("cPage"));
    }

    public void deleteList(){
        String idsStr = getPara("ids");
        UserGroup.dao.deleteList(idsStr);
        renderJson(getSuccessfulResultMap());
    }

    public void add(){
        render("_add.html");
    }

    public void save (){
        UserGroup usergroup = getModel(UserGroup.class);
        usergroup.save();
        redirect("/manage/usergroup");
    }

}
