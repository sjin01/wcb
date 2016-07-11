package com.sjin.model.doubleball;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.sjin.enums.doubleball.BallType;
import com.sjin.model.base.BaseDoubleballRecord;
import org.apache.commons.lang.StringUtils;

import java.util.List;

/**
 * Description:
 * 创建日期: 7/6  16:12
 *
 * t_doubleball_record
 *
 id int(11) NOT NULL AUTO_INCREMENT,
 period int(11) DEFAULT NULL COMMENT '开奖期号',
 value int(11) DEFAULT NULL COMMENT '开奖球号',
 type int(11) DEFAULT NULL COMMENT '1红球；2蓝球',
 PRIMARY KEY (id)

 * @author: guanshj QQ: 928990049
 */
public class DoubleballRecord extends BaseDoubleballRecord<DoubleballRecord> {

    public static final DoubleballRecord dao = new DoubleballRecord();

    /**
     * 普通分页
     */
    public Page<DoubleballRecord> paginate(int pageNumber, int pageSize) {
        return paginate(pageNumber, pageSize, "select * " , " from t_doubleball_record " +
                " order by id desc");
    }

    /**
     * 获取数据
     * @param pageNumber
     * @param pageSize
     * @return
     */
    public Page<Record> getRecord(int pageNumber, int pageSize) {
        String sqlstr = "select A.* , f.partition3,f.partition4,f.partition7 ,f.partition3break ,f.partition4break,f.partition7break,f.size,f.oddeven,f.sum,f.span,f.first,f.last from (" +
                "select period , max(case type when 11 then value else null end) redBall1," +
                "max(case type when 12 then value else null end) redBall2, " +
                "max(case type when 13 then value else null end) redBall3, " +
                "max(case type when 14 then value else null end) redBall4, " +
                "max(case type when 15 then value else null end) redBall5, " +
                "max(case type when 16 then value else null end) redBall6, " +
                "max(case type when 2 then value else null end) blueBall " +
                " from t_doubleball_record group by period order by period desc " +
                ") A " +
                "LEFT JOIN t_doubleball_record_feature f on f.period = A.period";
        return Db.paginate(pageNumber,pageSize , sqlstr , "" );
    }
    public Record getRecordByPeriod (int period) {
        String sqlstr = "select period , max(case type when 11 then value else null end) redBall1," +
                "max(case type when 12 then value else null end) redBall2, " +
                "max(case type when 13 then value else null end) redBall3, " +
                "max(case type when 14 then value else null end) redBall4, " +
                "max(case type when 15 then value else null end) redBall5, " +
                "max(case type when 16 then value else null end) redBall6, " +
                "max(case type when 2 then value else null end) blueBall " +
                " from t_doubleball_record where period = " + period;
        return Db.findFirst(sqlstr);
    }

    /**
     * 根据 期号查询红或蓝
     * @param period
     * @return
     */
    public List<DoubleballRecord> getRedByPeriod (int period) {
        return dao.find("select * from t_doubleball_record where type like '1%' and period = ? order by value" , period);
    }
    public DoubleballRecord getBlueByPeriod (int period) {
        return dao.findFirst("select * from t_doubleball_record where type =2 and period = ? " , period);
    }

    /**
     * 获取 每个号码出现的数目
     * @param type
     * @return
     */
    public List<Record> selectValueOrderByCount(int type){
        String whereStr = "";
        if(type == BallType.RED.getCode()) {
            whereStr = " type like '1%' " ;
        }else if(type == BallType.BLUE.getCode()){
            whereStr = " type = 2 ";
        }
        return Db.find( "select value, count(value) as count from t_doubleball_record where "+whereStr+" group by value order by count desc " ) ;
    }

    /**
     * 获取当期 期号
     * @return
     */
    public int getCurrentPeriod () {
        Record obj = Db.findFirst("select max(period) as period from t_doubleball_record");
        if(obj == null){
            return 0;
        }else{
            return obj.getInt("period");
        }
    }


    /**
     * 根据期号删除 开奖数据
     * @param period
     */
    public void deleteByPeriod (int period){
        Db.update("delete from t_doubleball_record where period = " + period);
    }
    public void deleteByPeriod (String ids) {
        if(!StringUtils.isEmpty(ids)){
            StringBuilder sqlsb = new StringBuilder();
            sqlsb.append("delete from t_doubleball_record where period in ( ");
            sqlsb.append(ids);
            sqlsb.append(" -1) ");

            Db.update(sqlsb.toString());
        }
    }

}
