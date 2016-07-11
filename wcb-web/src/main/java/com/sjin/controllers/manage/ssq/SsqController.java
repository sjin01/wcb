package com.sjin.controllers.manage.ssq;

import com.sjin.base.BaseController;
import com.sjin.constant.DataTableParam;
import com.sjin.constant.SysConstant;
import com.sjin.constant.doubleball.DoubleBallConstant;
import com.sjin.model.doubleball.DoubleballRecord;
import com.sjin.services.manage.sqq.DoubleballRecordService;
import com.sjin.vo.doubleball.DoubleBallDto;

/**
 * Description:   双色球分析  -----  开奖记录
 * 创建日期: 7/6  11:49
 *
 *                          _oo0oo_
 *                         o8888888o
 *                         88" . "88
 *                         (| -_- |)
 *                         0\  =  /0
 *                       ___/'---'\___
 *                     .' \\|     |// '.
 *                    / \\|||  :  |||// \
 *                   / _||||| -:- |||||_ \
 *                  |   | \\\  -  /// |   |
 *                  | \_|  ''\---/''  |_/ |
 *                  \  .-\__  '-'  __/-.  /
 *               ____'. .'  /--.--\  '. .'____
 *            .""  '<  `.___\_<|>_/___.'  >'  "".
 *           | | :   `_ \`.;`\ _ /`;.`/ _'   : | |
 *           \  \  `_.   \_ __\ /__ _/   ._'  /  /
 *       =====`-._____`.___ \_____/ ___.`_____.-`=====
 *                          '=---='
 *
 *       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 *
 *                     佛祖保佑   中500万
 *
 * @author: guanshj QQ: 928990049
 */

public class SsqController extends BaseController {

    public void index (){
        render("record.html");
    }

    public void recordDatatable() {
        Integer start = getParaToInt(DataTableParam.START);
        Integer pagesize = getParaToInt(DataTableParam.LENGTH);

        if(start == null || start==0) start = 0;
        if(pagesize == null || pagesize==0) pagesize = SysConstant.MANAGE_PAGESIZE;

        int page = start / pagesize + 1;

        renderJson(
                getSuccessResultMapDataTable(
                        DoubleballRecord.dao.getRecord(page, pagesize), getPara(DataTableParam.SECHO)
                )
        );
    }

    public void loadEditDialog (){
        int period = getParaToInt("period");
        if(period >0 ){
            setAttr("flag" , DoubleBallConstant.FLAG_UPDATE);
            setAttr("record" , DoubleballRecord.dao.getRecordByPeriod(period) ) ;
        }else{
            setAttr("flag" , DoubleBallConstant.FLAG_INSERT);
        }
        render("_editDialog.html");
    }

    public void save () throws Exception {
        DoubleballRecordService.service.saveDoubleBallRecord( getModel(DoubleBallDto.class) );
        renderJson(getSuccessfulResultMap());
    }

    /*public void delete (){
        DoubleballRecord.dao.deleteByPeriod( getParaToInt("period"));
        redirect("/manage/ssq/record");
    }*/
    public void deleteList(){
        String idsStr = getPara("ids");
        DoubleballRecord.dao.deleteByPeriod(idsStr);
        renderJson(getSuccessfulResultMap());
    }

}
