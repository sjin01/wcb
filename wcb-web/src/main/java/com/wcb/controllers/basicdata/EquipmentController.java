package com.wcb.controllers.basicdata;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.mysql.jdbc.StringUtils;
import com.wcb.base.BaseController;
import com.wcb.constant.SysConstant;
import com.wcb.interceptor.manage.ManageLoginInterceptor;
import com.wcb.model.Equipment;

/**
 * Description: 设备管理
 * 创建日期: 4/22  16:54
 * @author: sjin QQ: 928990049
 */
@Before(ManageLoginInterceptor.class)
public class EquipmentController extends BaseController {

    public void index () {
        String cPage = getPara("cPage");
        setAttr("pageData", Equipment.dao.paginate(StringUtils.isNullOrEmpty(cPage) ? 1 : Integer.valueOf(cPage), SysConstant.MANAGE_PAGESIZE));
        render("list.html");
    }

    public void add(){
        render("_add.html");
    }
    public void edit(){
        Integer id = getParaToInt("id");
        setAttr("equipment", Equipment.dao.findById(id));
        render("_edit.html");
    }

    public void save(){
        Equipment equipment = getModel(Equipment.class);
        equipment.save();
        redirect("/basicdata/equipment");
    }
    public void update (){
        Equipment equipment = getModel(Equipment.class);
        equipment.update();
        redirect("/basicdata/equipment");
    }

    public void delete() {
        Equipment.dao.deleteById(getParaToInt("id"));
        redirect("/basicdata/equipment?cPage=" + getPara("cPage"));
    }

    public void deleteList(){
        String idsStr = getPara("ids");
        Equipment.dao.deleteList(idsStr);
        redirect("/basicdata/equipment?cPage=" + getPara("cPage"));
    }

    public void getEquipment (){
        renderJson(getSuccessfulResultMap(Equipment.dao.getEquipmentAll()));
    }
}
