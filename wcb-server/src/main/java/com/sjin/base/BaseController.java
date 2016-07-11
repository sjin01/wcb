package com.sjin.base;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.sjin.enums.ResponseCodeEnum;

import java.util.HashMap;
import java.util.Map;

/**
 * Description:  控制器 公共内容
 * 创建日期: 5/6  9:40
 * @author: guanshj QQ: 928990049
 */
public class BaseController extends Controller{

    /**
     * ajax请求成功
     *
     * @return
     */
    protected Map<String, Object> getSuccessfulResultMap() {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("code", ResponseCodeEnum.AJAX_SUCCESS.getCode());
        return resultMap;
    }

    /**
     * ajax请求成功
     *
     * @param data
     *            返回的数据
     * @return
     */
    protected Map<String, Object> getSuccessfulResultMap(Object data) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("code", ResponseCodeEnum.AJAX_SUCCESS.getCode());
        resultMap.put("data", data);
        return resultMap;
    }

    /**
     * ajax请求成功
     *
     * @param page
     *            分页的信息
     * @param data
     *            返回的数据
     * @return
     */
    protected Map<String, Object> getSuccessfulResultMap(Object page,
                                                         Object data) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("code", ResponseCodeEnum.AJAX_SUCCESS.getCode());
        resultMap.put("data", data);
        resultMap.put("page", page);
        return resultMap;
    }

    /**
     * ajax请求失败
     *
     * @param enumeration
     *            错误码的枚举类
     * @return
     */
    protected Map<String, Object> getFailedResultMap(
            ResponseCodeEnum enumeration) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("code", enumeration.getCode());
        resultMap.put("data", enumeration.getMessage());
        return resultMap;
    }

    /**
     * ajax请求失败
     *
     * @param enumeration
     *            错误码的枚举类
     * @param message
     *            错误信息
     * @return
     */
    protected Map<String, Object> getFailedResultMap(
            ResponseCodeEnum enumeration, Object message) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("code", enumeration.getCode());
        resultMap.put("data", message);
        return resultMap;
    }

    /**
     * ajax请求成功：为jquery datatable分页设置信息
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public Map<String, Object> getSuccessResultMapDataTable(Page page , String sEcho) {

        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("aaData", page.getList());
        resultMap.put("sEcho", sEcho);
        resultMap.put("iTotalRecords", page.getTotalRow());
        resultMap.put("iTotalDisplayRecords", page.getTotalRow() );

        resultMap.put("code" , ResponseCodeEnum.AJAX_SUCCESS.getCode());
        return resultMap;
    }
}
