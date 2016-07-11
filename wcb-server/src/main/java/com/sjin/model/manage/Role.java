package com.sjin.model.manage;

import com.jfinal.plugin.activerecord.Page;
import com.sjin.model.base.BaseSysRole;

/**
 * 角色  t_sys_role
 *
     id                   int not null,
     name                 varchar(45),
     sort                 int,
     primary key (id)

 * @author: guanshj QQ: 928990049
 */
public class Role extends BaseSysRole<Role> {
    public static final Role dao = new Role();
    /**
     * 所有 sql 写在 Model 或 Service 中，不要写在 Controller 中，养成好习惯，有利于大型项目的开发与维护
     */
    public Page<Role> paginate(int pageNumber, int pageSize) {
        return paginate(pageNumber, pageSize, "select * " , " from t_sys_role order by sort ");
    }
}
