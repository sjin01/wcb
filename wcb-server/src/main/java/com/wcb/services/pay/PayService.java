package com.wcb.services.pay;

import com.wcb.base.BaseService;
import com.wcb.model.RecordPay;
import com.wcb.model.RecordSurvey;
import com.wcb.vo.pay.PayVo;

/**
 * Created by sjin on 17/2/22.
 */
public interface PayService extends BaseService {

    /**
     * 供外部条用
     */
    PayService serivce = new PayServiceImpl();

    /**
     * 保存 支付 记录
     * @param rp
     * @return
     * @throws Exception
     */
    RecordPay savePay(RecordPay rp) throws Exception ;

    /**
     * 保存抄表记录
     * @param rs
     * @return
     * @throws Exception
     */
    RecordSurvey saveSurvey(RecordSurvey rs) throws Exception;

    /**
     * 获取 账户总 产生的费用
     * @param accountid
     * @return
     */
    Double getSurveySumMoney(Integer accountid) ;

    /**
     * 获取 账户总 缴纳的 金额总和
     * @param accountid
     * @return
     */
    Double getPaySumMoney(Integer accountid);

    /**
     * 获取 缴费情况 展示对象
     * @param accountId
     * @return
     */
    PayVo getPayVo (Integer accountId);
}
