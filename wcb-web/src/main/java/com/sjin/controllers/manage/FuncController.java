package com.sjin.controllers.manage;

import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Record;
import com.sjin.base.BaseController;
import com.sjin.interceptor.manage.ManageLoginInterceptor;
import com.sjin.model.manage.Func;
import com.sjin.services.manage.FueluxTreeSerivce;
import com.sjin.validators.manage.FuncValidator;

import java.util.List;

/**
 * Description: 功能菜单管理
 * 创建日期: 5/6  9:52
 *
 * @author: guanshj QQ: 928990049
 */
@Before(ManageLoginInterceptor.class)
public class FuncController extends BaseController {

    public void index () {
        render("main.html");
    }

    public void treeData (){

        renderJson(
            getSuccessfulResultMap(
                FueluxTreeSerivce.serivce.FuncTreeData(
                    Integer.valueOf(
                        getPara("pid")
                    )
                )
            )
        );
    }

    /**进入编辑页面*/
    public void edit(){
//        System.out.println(getPara("id"));
        setAttr("func", Func.dao.findById(getPara("id")));

        List<Record> list=  Func.dao.getFuncByPid( Integer.parseInt(getPara("id")), 1);
        setAttr("sonCount" , list==null ? 0:list.size());
    }

    /** 保存操作*/
    @Before(FuncValidator.class)
    public void save(){
        getModel(Func.class).save();
        renderJson(getSuccessfulResultMap());
    }

    /** 更新操作*/
    @Before(FuncValidator.class)
    public void update(){
        getModel(Func.class).update();
        renderJson(getSuccessfulResultMap());
    }

    /** 删除操作 */
    public void delete(){
        Func.dao.deleteById(getPara("id"));
        Func.dao.clearRubbish();
        redirect("/manage/func");
    }
}
