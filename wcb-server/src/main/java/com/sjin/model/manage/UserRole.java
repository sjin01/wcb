package com.sjin.model.manage;

import com.jfinal.plugin.activerecord.Page;
import com.sjin.model.base.BaseSysUserRole;

/**
 * 用户角色  t_sys_user_role
 *
     id                   int not null,
     userid               int,
     roleid               int,
     primary key (id)
 *
 * @author: guanshj QQ: 928990049
 */
public class UserRole extends BaseSysUserRole<UserRole> {
    public static final UserRole dao = new UserRole();
    /**
     * 所有 sql 写在 Model 或 Service 中，不要写在 Controller 中，养成好习惯，有利于大型项目的开发与维护
     */
    public Page<UserRole> paginate(int pageNumber, int pageSize) {
        return paginate(pageNumber, pageSize, "select * " , " from t_sys_user_role ");
    }
}
