package com.wcb.config.routes;

import com.jfinal.config.Routes;
import com.wcb.controllers.pay.PayCtrl;

/**
 * 路由: 缴费管理
 * Created by sjin on 17/2/22.
 */
public class PayRoutes extends Routes {
    @Override
    public void config() {
        add("/pay", PayCtrl.class, "/views/pay");
    }
}
