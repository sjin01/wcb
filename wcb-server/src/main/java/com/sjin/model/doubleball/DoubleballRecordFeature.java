package com.sjin.model.doubleball;

import com.jfinal.plugin.activerecord.Page;
import com.sjin.model.base.BaseDoubleballRecordFeature;

/**
 * Description:   t_doubleball_record_feature
 *
 id                   int not null auto_increment comment '主键',
 period               int comment '开奖期号',
 partition3           varchar(20) comment '1-11、12-22、23-33三个分区的比例；如2-2-2',
 partition4           varchar(20) comment '1-8、9-16、18-25、26-33四个分区的比例；如2-2-2-0',
 partition7           varchar(20) comment '1-5、6-10、11-15、16-20、21-25、26-30、31-33七个分区的比例；如2-2-2-0-0-0-0',
 partition3break      varchar(20) comment '多个用“，”逗号隔开',
 partition4break      varchar(20) comment '多个用“，”逗号隔开',
 partition7break      varchar(20) comment '多个用“，”逗号隔开',
 size                 varchar(10),
 oddeven              varchar(10),
 sum                  int,
 span                 int,
 first                int,
 last                 int,
 *
 * 创建日期: 7/23  11:07
 *
 * @author: guanshj QQ: 928990049
 */
public class DoubleballRecordFeature extends BaseDoubleballRecordFeature<DoubleballRecordFeature> {

    public static final DoubleballRecordFeature dao = new DoubleballRecordFeature();

    /**
     * 普通分页
     */
    public Page<DoubleballRecordFeature> paginate(int pageNumber, int pageSize) {
        return paginate(pageNumber, pageSize, "select * " , " from t_doubleball_record_feature " +
                " order by id desc");
    }

    /**
     * 获取一期 特征
     * @param period
     * @return
     */
    public DoubleballRecordFeature getFeatureByPeriod (int period){
        return dao.findFirst("select * from t_doubleball_record_feature where period = ?" , period);
    }

    /*public void deleteByPeriod (int period){
        Db.update("delete from t_doubleball_record_feature where period = ?" , period);
    }*/
}
