package com.sjin.controllers.manage;

import com.jfinal.core.Controller;
import com.sjin.constant.SysConstant;
import com.sjin.model.manage.Dict;
import org.apache.commons.lang.StringUtils;

/**
 * Description:
 * 创建日期: 5/28  16:28
 *
 * @author: guanshj QQ: 928990049
 */
public class DictController extends Controller {

    public void index (){

        String page = getPara("page");
        setAttr("dictpage", Dict.dao.paginate(StringUtils.isEmpty(page)? 1:Integer.valueOf(page), SysConstant.MANAGE_PAGESIZE));

        render("main.html");
    }
}
