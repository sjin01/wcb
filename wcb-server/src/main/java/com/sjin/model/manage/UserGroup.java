package com.sjin.model.manage;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.mysql.jdbc.StringUtils;
import com.sjin.model.base.BaseSysUserGroup;

/**
 * 用户组 t_sys_user_group
 *
     id                   int not null,
     name                 int comment '用户组名',
     status               int comment '1正常；0禁用',
     sort                 int,
     primary key (id)
 *
 * @author: guanshj QQ: 928990049
 */
public class UserGroup extends BaseSysUserGroup<UserGroup> {

    public static final UserGroup dao = new UserGroup();
    /**
     * 所有 sql 写在 Model 或 Service 中，不要写在 Controller 中，养成好习惯，有利于大型项目的开发与维护
     */
    public Page<UserGroup> paginate(int pageNumber, int pageSize) {
        return paginate(pageNumber, pageSize, "select * " , " from t_sys_user_group order by sort ");
    }

    public void deleteList(String ids){
        if(!StringUtils.isNullOrEmpty(ids)){
            StringBuilder sqlsb = new StringBuilder();
            sqlsb.append("delete from t_sys_user_group where id in ( ");
            sqlsb.append(ids);
            sqlsb.append(" -1) ");

            Db.update(sqlsb.toString());
        }
    }
}
