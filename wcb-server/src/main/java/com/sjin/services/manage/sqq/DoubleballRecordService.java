package com.sjin.services.manage.sqq;

import com.sjin.model.doubleball.DoubleballRecord;
import com.sjin.services.manage.sqq.impl.DoubleballRecordServiceImpl;
import com.sjin.vo.doubleball.DoubleBallDto;

import java.util.List;

/**
 * Description:
 * 创建日期: 7/9  14:43
 *
 * @author: guanshj QQ: 928990049
 */
public interface DoubleballRecordService {

    DoubleballRecordService service = new DoubleballRecordServiceImpl();

    public List<Integer> getInt(List<DoubleballRecord> list);

    public Integer getInt (DoubleballRecord record);

    /**
     * 保存 开奖记录
     * @param dto (DoubleBallDto);
     *  period  期号
     *  redBall1 红球
     *  redBall2
     *  redBall3
     *  redBall4
     *  redBall5
     *  redBall6
     *  blueBall 蓝球
     *  flag 状态 1：新增；2：修改
     * @throws Exception
     */
    public void saveDoubleBallRecord (DoubleBallDto dto ) throws Exception ;

    /**
     * 根据期号更新 开奖记录特征
     * @param period
     * @throws Exception
     */
    public void updateRecordFeature (int period) throws Exception;
}
