package com.sjin.model.doubleball;

import com.jfinal.plugin.activerecord.Page;
import com.sjin.model.base.BaseDoubleballConjecture;

/**
 * Description:   t_doubleball_conjecture
 * 创建日期: 7/8  9:51
 *
 id     int not null auto_increment,
 period int null,
 value  int null,
 type   int null,

 primary key (id)
 *
 * @author: guanshj QQ: 928990049
 */
public class DoubleballConjecture extends BaseDoubleballConjecture<DoubleballConjecture> {

    public static final DoubleballConjecture dao = new DoubleballConjecture();

    /**
     * 普通分页
     */
    public Page<DoubleballConjecture> paginate(int pageNumber, int pageSize) {
        return paginate(pageNumber, pageSize, "select * " , " from t_doubleball_conjecture " +
                " order by id desc");
    }
}
