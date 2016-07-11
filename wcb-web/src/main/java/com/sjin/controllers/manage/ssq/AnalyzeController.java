package com.sjin.controllers.manage.ssq;

import com.sjin.base.BaseController;
import com.sjin.enums.doubleball.BallType;
import com.sjin.model.doubleball.DoubleballRecord;
import com.sjin.services.manage.sqq.DoubleballRecordService;
import org.apache.commons.lang.StringUtils;

import java.util.List;

/**
 * Description:  双色球分析 当期分析
 * 创建日期: 7/9  11:18
 * @author: guanshj QQ: 928990049
 */
public class AnalyzeController extends BaseController {

    public void index (){
        String period = getPara("period");
        if(StringUtils.isEmpty(period)){
            setAttr("period" ,DoubleballRecord.dao.getCurrentPeriod());
        }else{
            setAttr("period" ,Integer.parseInt(period));
        }
        render("main.html");
    }

    public void overview(){
        int period = getParaToInt("period");
        // 本期号码
        List<Integer> currentRed = DoubleballRecordService.service.getInt(DoubleballRecord.dao.getRedByPeriod(period)); // 六个红球
        Integer currentBlue = DoubleballRecordService.service.getInt(DoubleballRecord.dao.getBlueByPeriod(period));     // 蓝球
        setAttr("currentPeriod", period);
        setAttr("currentRed", currentRed);
        setAttr("currentBlue", currentBlue);

        // 上期号码：
        period = period -1;
        List<Integer> prevRed = DoubleballRecordService.service.getInt(DoubleballRecord.dao.getRedByPeriod(period));   // 六个红球
        Integer prevBlue = DoubleballRecordService.service.getInt(DoubleballRecord.dao.getBlueByPeriod(period));       // 蓝球

        if(prevRed!=null && !prevRed.isEmpty() && prevBlue!=null){  // 也许没有上一期的数据呢
            setAttr("prevPeriod", period);
            setAttr("prevRed", prevRed);
            setAttr("prevBlue", prevBlue);
        }

        // 最多开出号码：
        setAttr("maxRed", DoubleballRecord.dao.selectValueOrderByCount(BallType.RED.getCode()));
        setAttr("maxBlue", DoubleballRecord.dao.selectValueOrderByCount(BallType.BLUE.getCode()));

        render("_overview.html");
    }
    public void analyzePrev(){
        render("_analyzePrev.html");
    }
    public void analyzeCurrent(){
        render("_analyzeCurrent.html");
    }
}
