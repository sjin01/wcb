package com.wcb.config.routes;

import com.jfinal.config.Routes;
import com.wcb.controllers.basicdata.AccountController;
import com.wcb.controllers.basicdata.ChargeStandard;
import com.wcb.controllers.basicdata.EquipmentController;

/**
 * 路由 for Basic data
 * Created by sjin on 17/2/22.
 */
public class BasicdataRoutes extends Routes {
    @Override
    public void config() {
        add("/basicdata/equipment", EquipmentController.class, "/views/basicdata/equipment");    // 设备管理
        add("/basicdata/account", AccountController.class, "/views/basicdata/account");              // 账户管理
        add("/basicdata/chargeStandard", ChargeStandard.class, "/views/basicdata/chargeStandard");   // 收费标准维护
    }
}
