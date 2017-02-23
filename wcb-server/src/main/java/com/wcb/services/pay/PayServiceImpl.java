package com.wcb.services.pay;

import com.wcb.base.BaseServiceImpl;
import com.wcb.enums.PayStatusEnum;
import com.wcb.model.Dict;
import com.wcb.model.RecordPay;
import com.wcb.model.RecordSurvey;
import com.wcb.vo.pay.PayVo;

import java.util.Date;

/**
 * Created by sjin on 17/2/22.
 */
public class PayServiceImpl extends BaseServiceImpl implements PayService {

    /**
     * 保存 支付 记录
     */
    public RecordPay savePay(RecordPay rp) throws Exception {
        if (rp == null || rp.getMoney() == null || rp.getTheorymoney() == null || rp.getAccountid() == null) {
            throw new Exception();
        }

        rp.setMoney(rp.getMoney() * 100);
        rp.setTheorymoney(rp.getTheorymoney() * 100);

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
     * 获取 账户总 产生的费用 单位:元
     */
    public Double getSurveySumMoney(Integer accountid) {
        Integer fen = RecordSurvey.dao.getSumMoney(accountid);
        if (fen != null) {
            return (double) (fen / 100);
        } else {
            return 0.0;
        }
    }

    /**
     * 获取 账户总 缴纳的 金额总和  单位:元
     */
    public Double getPaySumMoney(Integer accountid) {
        Integer fen = RecordPay.dao.getSumMoney(accountid);
        if (fen != null) {
            return (double) (fen / 100);
        } else {
            return 0.0;
        }
    }

    /**
     * 获取 缴费情况 展示对象
     */
    @Override
    public PayVo getPayVo(Integer accountId) {
        Integer sumSurveyMoneyFen = RecordSurvey.dao.getSumMoney(accountId); // 总产生费用
        Integer sumPayMoneyFen = RecordPay.dao.getSumMoney(accountId);   // 总缴纳费用
        Integer owe = sumSurveyMoneyFen - sumPayMoneyFen;   // 欠费
        PayVo vo = new PayVo();
        if (owe > 0) {
            vo.setStatus(PayStatusEnum.OWE.getCode());
            vo.setOweMoney((double) (owe / 100));
        } else if (owe < 0) {
            vo.setStatus(PayStatusEnum.BALANCE.getCode());
            vo.setOweMoney((double) (Math.abs(owe) / 100));
        } else {
            vo.setStatus(PayStatusEnum.FINISH.getCode());
        }
        vo.setSumSurveyMoney((double) (sumSurveyMoneyFen / 100));
        vo.setSumPayMoney((double) (sumPayMoneyFen / 100));
        return vo;
    }
}
