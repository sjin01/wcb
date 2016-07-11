package com.sjin.controllers.timeline;

import com.jfinal.core.Controller;
import com.sjin.model.timeline.Timeline;
import com.sjin.model.timeline.TimelineMore;
import com.sjin.vo.TimelineVo;

import java.util.ArrayList;
import java.util.List;

/**
 * Description:  时间轴 （我们的点点滴滴）
 * 创建日期: 6/11  11:13
 *
 * @author: guanshj QQ: 928990049
 */
public class TimelineController extends Controller {

    public void index (){
        this.setAttr( "years" ,Timeline.dao.selectYearsByType(1) );
        render("main.html");
    }

    public void timelinedata () {
        List<Timeline> timelineList = Timeline.dao.selectDataByYear(getPara("year"), 1);

        List<TimelineVo> dataList = new ArrayList<TimelineVo>();
        for(Timeline t : timelineList){

            TimelineVo vo = new TimelineVo();
            vo.setYear(t.getStr("year"));

            vo.setDate(t.getStr("date"));
            vo.setTxt(t.getStr("txt"));
            vo.setVersion(t.getStr("version"));

            List<TimelineMore> timelinemoreList = TimelineMore.dao.selectByTid( t.getInt("id") );
            List<String> moreTxtList = new ArrayList<String>();
            for(TimelineMore tm:timelinemoreList){
                moreTxtList.add(tm.getStr("txt"));
            }
            vo.setMoreTxt( moreTxtList );

            dataList.add(vo);
        }
        this.setAttr("dataList",dataList);

        render("_data.html");
    }
}
