package com.sjin.interceptor.manage;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import com.sjin.constant.SysConstant;
import com.sjin.enums.UserTypeEnum;
import com.sjin.model.manage.User;


/**
 * Description: 后台系统检查管理员登陆 登陆  拦截器  (在controller 或者 action 上注释使用)
 * 创建日期: 4/1  11:17
 *
 * @author: guanshj QQ: 928990049
 */
public class ManageLoginInterceptor implements Interceptor {

    @Override
    public void intercept(Invocation invocation) {
        /*System.out.println("Before invoking " + ai.getActionKey());
        System.out.println(JFinal.me().getServletContext().getAttribute("base"));*/

        // 从 session 拿登陆用户
        Controller controller = invocation.getController();
        User user = controller.getSessionAttr(SysConstant.SESSIONKEY_LOGIN_USER);

        if(user == null){
            // 用户未登陆
            controller.setSessionAttr(SysConstant.SESSIONKEY_MANAGE_ERROR ,"请登陆");
            controller.redirect("/manage/login");
            return ;
        }else{
            // 不是 管理员， 无法进去后台管理
            Integer userType = user.get("usertype");
            if( !user.get("usertype").equals(UserTypeEnum.SUPERADMIN.getCode())
                    && !user.get("usertype").equals(UserTypeEnum.ADMIN.getCode()) ){
                System.out.println("你不是管理员");
                controller.setSessionAttr(SysConstant.SESSIONKEY_MANAGE_ERROR ,"你不是管理员");
                controller.redirect("/manage/login");
                return ;
            }
        }

        invocation.invoke();
        /*System.out.println("After invoking " + ai.getActionKey());
        System.out.println(JFinal.me().getServletContext().getAttribute("base"));*/
    }
}
