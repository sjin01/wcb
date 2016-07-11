package com.sjin.services.manage.sqq.impl;

import com.sjin.constant.doubleball.DoubleBallConstant;
import com.sjin.enums.doubleball.BallType;
import com.sjin.model.doubleball.DoubleballRecord;
import com.sjin.model.doubleball.DoubleballRecordFeature;
import com.sjin.services.manage.sqq.DoubleballRecordService;
import com.sjin.util.doubleball.FeatureUtil;
import com.sjin.vo.doubleball.DoubleBallDto;

import java.util.ArrayList;
import java.util.List;

/**
 * Description:
 * 创建日期: 7/9  14:44
 *
 * @author: guanshj QQ: 928990049
 */
public class DoubleballRecordServiceImpl implements DoubleballRecordService {

    /**
     * 根据对象，得到int值
     * @param list
     * @return
     */
    @Override
    public List<Integer> getInt(List<DoubleballRecord> list){
        List<Integer> result = new ArrayList<Integer>();
        for(DoubleballRecord itme : list){
            result.add( itme.getInt("value") );
        }
        return result;
    }
    @Override
    public Integer getInt (DoubleballRecord record){
        return record.getInt("value");
    }

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
    @Override
    public void saveDoubleBallRecord (DoubleBallDto dto ) throws Exception {
        // step1 : validate data
        if (dto.getPeriod() == null || dto.getRedBall1() == null || dto.getRedBall2() == null || dto.getRedBall3() == null
                || dto.getRedBall4() == null || dto.getRedBall5() == null || dto.getRedBall6() == null || dto.getBlueBall() == null) {
            System.out.println("参数不正确");
            throw new Exception();
        }

        if(DoubleBallConstant.FLAG_UPDATE.equals(dto.getFlag())){
            // 清理数据
            DoubleballRecord.dao.deleteByPeriod(dto.getPeriod());
        }

        // step2 : 保存 数据
        //红球1
        DoubleballRecord redBall1_Record = new DoubleballRecord();
        redBall1_Record.set("period", dto.getPeriod());
        redBall1_Record.set("value", dto.getRedBall1());
        redBall1_Record.set("type", BallType.RED1.getCode());

        redBall1_Record.save();


        //红球2
        DoubleballRecord redBall2_Record = new DoubleballRecord();
        redBall2_Record.set("period", dto.getPeriod());
        redBall2_Record.set("value", dto.getRedBall2());
        redBall2_Record.set("type", BallType.RED2.getCode());

        redBall2_Record.save();

        //红球3
        DoubleballRecord redBall3_Record = new DoubleballRecord();
        redBall3_Record.set("period", dto.getPeriod());
        redBall3_Record.set("value", dto.getRedBall3());
        redBall3_Record.set("type", BallType.RED3.getCode());

        redBall3_Record.save();

        //红球4
        DoubleballRecord redBall4_Record = new DoubleballRecord();
        redBall4_Record.set("period", dto.getPeriod());
        redBall4_Record.set("value", dto.getRedBall4());
        redBall4_Record.set("type", BallType.RED4.getCode());

        redBall4_Record.save();

        //红球5
        DoubleballRecord redBall5_Record = new DoubleballRecord();
        redBall5_Record.set("period", dto.getPeriod());
        redBall5_Record.set("value", dto.getRedBall5());
        redBall5_Record.set("type", BallType.RED5.getCode());

        redBall5_Record.save();

        //红球6
        DoubleballRecord redBall6_Record = new DoubleballRecord();
        redBall6_Record.set("period", dto.getPeriod());
        redBall6_Record.set("value", dto.getRedBall6());
        redBall6_Record.set("type", BallType.RED6.getCode());

        redBall6_Record.save();

        // 蓝球
        DoubleballRecord blueBall_Record = new DoubleballRecord();
        blueBall_Record.set("period", dto.getPeriod());
        blueBall_Record.set("value", dto.getBlueBall());
        blueBall_Record.set("type",BallType.BLUE.getCode());

        blueBall_Record.save();

        /**
         * 更新 特征
         */
        updateRecordFeature(dto.getPeriod());
    }

    @Override
    public void updateRecordFeature(int period) throws Exception {
        List<Integer> redList = getInt(DoubleballRecord.dao.getRedByPeriod(period));
        boolean isnew = false;

        DoubleballRecordFeature feature = DoubleballRecordFeature.dao.getFeatureByPeriod(period);
        if(feature == null){
            feature = new DoubleballRecordFeature();
            feature.set("period" , period);
            isnew = true;
        }

        feature.set("partition3" , FeatureUtil.getPartition3(redList) );
        feature.set("partition4" , FeatureUtil.getPartition4(redList) );
        feature.set("partition7" , FeatureUtil.getPartition7(redList) );

        feature.set("partition3break" , FeatureUtil.getPartition3break(redList) );
        feature.set("partition4break" , FeatureUtil.getPartition4break(redList) );
        feature.set("partition7break" , FeatureUtil.getPartition7break(redList) );

        feature.set("size", FeatureUtil.getSizeRatio(redList) );
        feature.set("oddeven", FeatureUtil.getOddeven(redList) );
        feature.set("sum", FeatureUtil.getSum(redList) );
        feature.set("span", FeatureUtil.getSpan(redList) );
        feature.set("first", FeatureUtil.getFirst(redList) );
        feature.set("last", FeatureUtil.getLast(redList) );

        if(isnew){
            feature.save();
        }else{
            feature.update();
        }
    }
}
