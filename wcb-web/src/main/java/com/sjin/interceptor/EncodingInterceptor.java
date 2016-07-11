package com.sjin.interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;

import java.io.UnsupportedEncodingException;

/**
 * Description:  总拦截器
 * 创建日期: 5/5  11:05
 *
 * @author: guanshj QQ: 928990049
 */
public class EncodingInterceptor implements Interceptor {

    @Override
    public void intercept(Invocation invocation) {
        try {
            invocation.getController().getRequest().setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        invocation.invoke();
    }
}
