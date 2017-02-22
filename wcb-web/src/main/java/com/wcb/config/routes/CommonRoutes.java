package com.wcb.config.routes;

import com.jfinal.config.Routes;
import com.wcb.controllers.common.CommonController;
import com.wcb.controllers.index.IndexController;
import com.wcb.controllers.login.LoginController;

/**
 * 路由
 * 前台 和 公共的
 * Created by sjin on 17/2/22.
 */
public class CommonRoutes extends Routes {

    @Override
    public void config() {
        add("/", IndexController.class, "/views/");
        add("/common", CommonController.class, "/views/common");
        add("/login", LoginController.class, "/views/login");
    }
}
