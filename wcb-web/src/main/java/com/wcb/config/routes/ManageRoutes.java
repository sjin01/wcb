package com.wcb.config.routes;

import com.jfinal.config.Routes;
import com.wcb.controllers.manage.FuncController;
import com.wcb.controllers.manage.ManageIndexController;
import com.wcb.controllers.manage.RoleCtrl;
import com.wcb.controllers.manage.UsersController;

/**
 * 路由 for manage
 * Created by sjin on 17/2/22.
 */
public class ManageRoutes extends Routes{
    @Override
    public void config() {
        add("/manage/main", ManageIndexController.class, "/views/manage/main");  // 后台工作台
        add("/manage/user", UsersController.class, "/views/manage/user");                // 用户管理
        add("/manage/role", RoleCtrl.class, "/views/manage/role");                           // 角色管理
        add("/manage/func", FuncController.class, "/views/manage/func");                 // 菜单管理
    }
}
