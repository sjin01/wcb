package com.sjin.model.manage;

import com.jfinal.plugin.activerecord.Page;
import com.sjin.model.base.BaseSysRoleFunc;

/**
 * 角色权限 t_sys_role_func
 *
     id                   int not null,
     roleid               int,
     funcid               int,
     primary key (id)
 *
 * @author: guanshj QQ: 928990049
 */
public class RoleFunc extends BaseSysRoleFunc<RoleFunc> {

    public static final RoleFunc dao = new RoleFunc();
    /**
     * 所有 sql 写在 Model 或 Service 中，不要写在 Controller 中，养成好习惯，有利于大型项目的开发与维护
     */
    public Page<RoleFunc> paginate(int pageNumber, int pageSize) {
        return paginate(pageNumber, pageSize, "select * " , " from t_sys_role_func ");
    }
}
