package com.sjin.controllers.manage;

import com.jfinal.aop.Before;
import com.mysql.jdbc.StringUtils;
import com.sjin.base.BaseController;
import com.sjin.constant.SysConstant;
import com.sjin.interceptor.manage.ManageLoginInterceptor;
import com.sjin.model.manage.User;
import com.sjin.validators.manage.UserValidator;

import java.util.Date;

/**
 * Description: 用户模块控制器
 * 创建日期: 4/1  10:28
 * @author: guanshj QQ: 928990049
 */
@Before(ManageLoginInterceptor.class)
public class UsersController extends BaseController {

    public void index () {
//        System.out.println(JFinal.me().getServletContext().getAttribute("base"));
        String page = getPara("page");
        if(StringUtils.isNullOrEmpty(page)) page = "1";
        setAttr("page" , page);
        render("user.html");
    }

    public void list (){
        String page = getPara("page");
        setAttr("userpage", User.dao.paginate(Integer.valueOf(page), SysConstant.MANAGE_PAGESIZE));
        render("_list.html");
    }

    public void add(){

    }

    @Before(UserValidator.class)
    public void save() {
        User user = getModel(User.class);
        user.set("registerdate" , new Date());
        user.set("registertype" , 0);
        user.save();
        redirect("/manage/user");
    }

    public void edit() {
        setAttr("user", User.dao.findById(getParaToInt()));
    }

    @Before(UserValidator.class)
    public void update() {
        getModel(User.class).update();
        redirect("/manage/user");
    }

    public void delete() {
        User.dao.deleteById(getParaToInt());
        redirect("/manage/user");
    }

    /**
     * 批量删除， 同时也是 ajax示例
     */
    public void deleteList(){
        String idsStr = getPara("ids");
        User.dao.deleteList(idsStr);
        renderJson(getSuccessfulResultMap());

        /*System.out.println(idsStr);
        String[] idsStrArr = idsStr.split(",");*/
//        redirect("/manage/user");
    }

    /*public void testajax(){
        Map map = getParaMap();

        System.out.println(getPara("param3"));
        renderJson(User.dao.paginate(1, 10));
    }*/
}
