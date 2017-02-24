package com.wcb.controllers.basicdata;

import com.jfinal.aop.Before;
import com.mysql.jdbc.StringUtils;
import com.wcb.base.BaseController;
import com.wcb.constant.SysConstant;
import com.wcb.enums.StatusEnum;
import com.wcb.interceptor.manage.ManageLoginInterceptor;
import com.wcb.model.Account;
import com.wcb.model.AccountEquipment;
import com.wcb.model.ProvCityAreaStreet;

import java.util.Date;

/**
 * 用户登记
 * Created by xiao_ on 2016/12/26.
 */
@Before(ManageLoginInterceptor.class)
public class AccountController extends BaseController {

    public void index() {
        String cPage = getPara("cPage");
        setAttr("pageData", Account.dao.paginate(StringUtils.isNullOrEmpty(cPage) ? 1 : Integer.valueOf(cPage), SysConstant.MANAGE_PAGESIZE, null));
        render("list.html");
    }

    public void add() {
        render("add.html");
    }

    public void edit() {
        Integer id = getParaToInt();
        Account a = Account.dao.findById(id);

        if (a.getProvince() != null && a.getCity() != null && a.getArea() != null) {
            ProvCityAreaStreet prov = ProvCityAreaStreet.dao.getByCode(String.valueOf(a.getProvince()));
            ProvCityAreaStreet city = ProvCityAreaStreet.dao.getByCode(String.valueOf(a.getCity()));
            ProvCityAreaStreet area = ProvCityAreaStreet.dao.getByCode(String.valueOf(a.getArea()));
            a.setProvCityAreaStreetChoice(prov.getName() + " " + city.getName() + " " + area.getName());
        }

        setAttr("account", a);
        render("edit.html");
    }

    public void save() {
        // 账户 表
        Account account = getModel(Account.class);
        account.setSignindate(new Date());
        account.setAddr(account.getCommunityname() + account.getRidgepole() + "栋" + account.getHousehold() + "户");
        account.save();

        // 账户 设备关系表
        Integer equipmentid = getParaToInt("equipmentid");
        if (equipmentid != null) {
            AccountEquipment ae = new AccountEquipment();
            ae.setAccountid(account.getId());
            ae.setEquipmentid(equipmentid);
            ae.setCreatedate(new Date());
            ae.setStatus(StatusEnum.NORMAL.getFalg());
            ae.save();
        }

        redirect("/basicdata/account");
    }

    public void update() {
        Account account = getModel(Account.class);
        account.setAddr(account.getCommunityname() + account.getRidgepole() + "栋" + account.getHousehold() + "户");
        account.update();

        // 账户 设备关系表
        Integer equipmentid = getParaToInt("equipmentid");
        if (equipmentid != null) {
            AccountEquipment ae = AccountEquipment.dao.getAccountEquipment(account.getId(), equipmentid);
            if(ae == null){
                ae = new AccountEquipment();
                ae.setAccountid(account.getId());
                ae.setEquipmentid(equipmentid);
                ae.setCreatedate(new Date());
                ae.setStatus(StatusEnum.NORMAL.getFalg());
                ae.save();
            }
        }

        redirect("/basicdata/account");
    }

    public void delete() {
        Account.dao.deleteById(getParaToInt("id"));
        redirect("/basicdata/account?cPage=" + getPara("cPage"));
    }

    public void deleteList() {
        String idsStr = getPara("ids");
        Account.dao.deleteList(idsStr);
        redirect("/basicdata/account?cPage=" + getPara("cPage"));
    }
}
