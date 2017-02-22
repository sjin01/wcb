package com.wcb.services.pay;

import com.wcb.base.BaseServiceImpl;
import com.wcb.enums.PayStatusEnum;
import com.wcb.model.Dict;
import com.wcb.model.RecordPay;
import com.wcb.model.RecordSurvey;

import java.util.Date;

/**
 * Created by sjin on 17/2/22.
 */
public class PayServiceImpl extends BaseServiceImpl implements PayService {

    /**
     * 保存 支付 记录
     *
     * @param rp
     * @return
     * @throws Exception
     */
    public RecordPay savePay(RecordPay rp) throws Exception {
        if (rp == null || rp.getMoney() == null || rp.getTheorymoney() == null || rp.getAccountid() == null) {
            throw new Exception();
        }

        if (rp.getMoney() > rp.getTheorymoney()) {
            // 有余额
            rp.setStatus(PayStatusEnum.BALANCE.getCode());
            rp.setBalance(rp.getMoney() - rp.getTheorymoney());
        } else if (rp.getMoney() < rp.getTheorymoney()) {
            // 有欠款
            rp.setStatus(PayStatusEnum.OWE.getCode());
            rp.setBalance(rp.getTheorymoney() - rp.getMoney());
        } else {
            // 缴清
            rp.setStatus(PayStatusEnum.FINISH.getCode());
        }

        rp.setPaydate(new Date());
        rp.save();
        return rp;
    }

    /**
     * 保存抄表记录
     *
     * @param rs
     * @return
     * @throws Exception
     */
    public RecordSurvey saveSurvey(RecordSurvey rs) throws Exception {
        if (rs == null || rs.getAccountid() == null || rs.getType() == null || rs.getValue() == null || rs.getReaddate() == null) {
            throw new Exception();
        }
        // 获取最近的抄表度数
        RecordSurvey recent = RecordSurvey.dao.getSurveyByAccountIdForFirst(rs.getAccountid());
        Double recentVal = recent == null ? 0 : recent.getValue();
        // 设置用量
        rs.setUsevalue(rs.getValue() - recentVal);
        // 设置产生费用
        rs.setMoney((int) (rs.getUsevalue() * Dict.dao.getChargeStandardForWater() * 100));    // 用量 * 单价(元/吨) * 100 = 产生费用(分)
        rs.setCreatedate(new Date());
        rs.save();
        return rs;
    }

    /**
     * 获取 账户总 产生的费用
     * @param accountid
     * @return
     */
    public Double getSurveySumMoney(Integer accountid) {
        return RecordSurvey.dao.getSumMoney(accountid);
    }

    /**
     * 获取 账户总 缴纳的 金额总和
     * @param accountid
     * @return
     */
    public Double getPaySumMoney(Integer accountid) {
        return RecordPay.dao.getSumMoney(accountid);
    }
}
