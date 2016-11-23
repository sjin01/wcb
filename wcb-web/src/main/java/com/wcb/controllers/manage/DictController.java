package com.wcb.controllers.manage;

import com.jfinal.aop.Before;
import com.wcb.base.BaseController;
import com.wcb.constant.SysConstant;
import com.wcb.interceptor.manage.ManageLoginInterceptor;
import com.wcb.model.Dict;
import org.apache.commons.lang.StringUtils;

/**
 * Description:
 * 创建日期: 5/28  16:28
 *
 * @author: guanshj QQ: 928990049
 */
@Before(ManageLoginInterceptor.class)
public class DictController extends BaseController {

    public void index (){

        String page = getPara("page");
        setAttr("dictpage", Dict.dao.paginate(StringUtils.isEmpty(page)? 1:Integer.valueOf(page), SysConstant.MANAGE_PAGESIZE));

        render("main.html");
    }
}
