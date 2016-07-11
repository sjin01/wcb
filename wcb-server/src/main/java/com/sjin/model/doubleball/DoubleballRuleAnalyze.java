package com.sjin.model.doubleball;

import com.jfinal.plugin.activerecord.Page;
import com.sjin.model.base.BaseDoubleballRuleAnalyze;

/**
 * Description:  t_doubleball_rule_analyze
 * 创建日期: 7/15  16:21
 *
 id  int NULL AUTO_INCREMENT COMMENT '主键' ,
 code  varchar(20) NULL COMMENT '规则编号：如SH1 SL1 等' ,
 period  int NULL COMMENT '期号' ,
 analyze  varchar(200) NULL COMMENT '分析：多个号码用逗号分隔' ,
 result  int NULL COMMENT '结果：1对；0错' ,

 * @author: guanshj QQ: 928990049
 */
public class DoubleballRuleAnalyze extends BaseDoubleballRuleAnalyze<DoubleballRuleAnalyze> {

    public static final DoubleballRuleAnalyze dao = new DoubleballRuleAnalyze();

    /**
     * 普通分页
     */
    public Page<DoubleballRuleAnalyze> paginate(int pageNumber, int pageSize) {
        return paginate(pageNumber, pageSize, "select * " , " from t_doubleball_rule_analyze " +
                " order by id desc");
    }
}
