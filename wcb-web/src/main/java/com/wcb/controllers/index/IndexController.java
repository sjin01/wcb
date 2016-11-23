package com.wcb.controllers.index;

import com.jfinal.core.Controller;

/**
 * Description: 网站首页
 * http://localhost:8080/
 * 创建日期: 4/20  10:51
 *
 * @author: guanshj QQ: 928990049
 */
public class IndexController extends Controller {

    public void index () {
//        System.out.println(JFinal.me().getServletContext().getAttribute("base"));
//        setAttr("userpage", User.dao.paginate(1, 10));
        redirect("/manage/main");
    }

    public void testComponent (){
        render("test/component.html");
    }
}
