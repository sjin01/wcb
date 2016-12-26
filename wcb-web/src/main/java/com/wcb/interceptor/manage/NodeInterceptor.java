package com.wcb.interceptor.manage;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import com.jfinal.core.JFinal;
import com.wcb.model.Func;

import java.util.ArrayList;
import java.util.List;

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
        String base = JFinal.me().getServletContext().getContextPath();  // 域名 或者ip等前缀
        String path = pathname.substring(base.length(), pathname.length());
        if(path.lastIndexOf("/") == (path.length()-1)){  // 去除最后面的斜杠
            path = path.substring(0, path.length()-1);
        }
        Func func = Func.dao.getFuncByPath(path);

        if(func !=null) {
            /*int pid = func.getInt("pid");
            if(pid !=0){
                Func pfunc = Func.dao.findById(pid);
                controller.setAttr("funcpid", pfunc.getInt("id"));
                controller.setAttr("funcp", pfunc);
            }

            controller.setAttr("funccid" , func.getInt("id"));
            controller.setAttr("funcc", func);*/

            List<Func> nodeList = new ArrayList<>();
            nodeList.add(0, func);
            setNodeList(nodeList, func.getPid());
            controller.setAttr("nodeList", nodeList);
        }

        invocation.invoke();
    }

    private List<Func> setNodeList (List<Func> nodeList, Integer id) {
        if(id !=0){
            Func item = Func.dao.findById(id);
            nodeList.add(0, item);
            setNodeList(nodeList, item.getPid());
        }
        return nodeList;
    }
}
