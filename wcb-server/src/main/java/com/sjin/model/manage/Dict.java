package com.sjin.model.manage;

import com.jfinal.plugin.activerecord.Page;
import com.sjin.model.base.BaseSysDict;

/**
 *  数据字典  t_sys_dict
 *
     id                   int not null,
     code                 varchar(45),
     name                 varchar(45),
     type                 varchar(45),
     sort                 int,
     status               int comment '0：禁用；1：正常',
     primary key (id)
 *
 * @author: guanshj QQ: 928990049
 */
public class Dict extends BaseSysDict<Dict> {
    public static final Dict dao = new Dict();
    /**
     * 所有 sql 写在 Model 或 Service 中，不要写在 Controller 中，养成好习惯，有利于大型项目的开发与维护
     */
    public Page<Dict> paginate(int pageNumber, int pageSize) {
        return paginate(pageNumber, pageSize, "select * " , " from t_sys_dict order by sort asc");
    }
}
