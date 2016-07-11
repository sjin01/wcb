package com.sjin.interceptor.manage;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import com.jfinal.core.JFinal;
import com.sjin.model.manage.Func;

/**
 * Description:   后台：获取当前节点的 拦截器
 * 创建日期: 5/21  15:07
 *
 * @author: guanshj QQ: 928990049
 */
public class NodeInterceptor implements Interceptor {

    @Override
    public void intercept(Invocation invocation) {

        Controller controller = invocation.getController();

        //  可以把这一段东西 丢到 拦截器里面去
        String pathname = controller.getPara("pathname");
        String base = JFinal.me().getServletContext().getContextPath();

        String path = pathname.substring(base.length(), pathname.length() - 1);
        Func func = Func.dao.getFuncByPath(path);

        if(func !=null) {
            int pid = func.getInt("pid");
            if(pid !=0){
                Func pfunc = func.dao.findById(pid);
                controller.setAttr("funcpid", pfunc.getInt("id"));
                controller.setAttr("funcp", pfunc);
            }

            controller.setAttr("funccid" , func.getInt("id"));
            controller.setAttr("funcc" , func);
        }

        invocation.invoke();
    }
}
