package com.sjin.model.doubleball;

import com.jfinal.plugin.activerecord.Page;
import com.sjin.model.base.BaseDoubleballRule;

/**
 * Description:   t_doubleball_rule
 * 创建日期: 7/15  16:21
 *
 id  int null auto_increment comment '主键' ,
 code  varchar(20) null comment '规则编号：如sh1 sl1 等' ,
 txt  varchar(1024) null comment '规则描述',

 * @author: guanshj QQ: 928990049
 */
public class DoubleballRule extends BaseDoubleballRule<DoubleballRule> {

    public static final DoubleballRule dao = new DoubleballRule();

    /**
     * 普通分页
     */
    public Page<DoubleballRule> paginate(int pageNumber, int pageSize) {
        return paginate(pageNumber, pageSize, "select * " , " from t_doubleball_rule " +
                " order by id desc");
    }
}
