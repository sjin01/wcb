package com.wcb.config;

import com.jfinal.config.*;
import com.jfinal.core.JFinal;
import com.jfinal.render.FreeMarkerRender;
import com.jfinal.render.ViewType;
import com.wcb.base.BaseConfig;

import com.wcb.controllers.basicdata.AccountController;
import com.wcb.controllers.basicdata.EquipmentController;
import com.wcb.controllers.common.CommonController;
import com.wcb.controllers.index.IndexController;
import com.wcb.controllers.login.LoginController;
import com.wcb.controllers.manage.*;
import freemarker.template.TemplateModelException;

import javax.servlet.ServletContext;

/**
 * Description:  API引导式配置
 * 创建日期: 4/2  9:49
 *
 * @author: guanshj QQ: 928990049
 */
public class WcbConfig extends BaseConfig {

    /**
     * 配置常量
     */
    @Override
    public void configConstant(Constants constants) {
        super.configConstant(constants);
        constants.setViewType(ViewType.FREE_MARKER);  // 渲染模板类型
        constants.setEncoding("utf-8");               // coding type
    }

    /**
     * 配置路由
     */
    @Override
    public void configRoute(Routes routes) {
        super.configRoute(routes);
        // 前台
        routes.add("/", IndexController.class);
        routes.add("/common", CommonController.class);
        routes.add("/login", LoginController.class);

        // 系统管理
        routes.add("/manage/main", ManageIndexController.class);
        routes.add("/manage/user", UsersController.class);
        routes.add("/manage/role", RoleCtrl.class);
        routes.add("/manage/func", FuncController.class);

        // 基础数据
        routes.add("/basicdata/equipment", EquipmentController.class);
        routes.add("/basicdata/account", AccountController.class);

        // 暂时没用上的
        routes.add("/manage/dict", DictController.class);
        routes.add("/manage/usergroup" ,UserGroupController.class);
    }

    /**
     * 配置插件
     */
    @Override
    public void configPlugin(Plugins plugins) {
        super.configPlugin(plugins);
    }

    /**
     * 配置全局拦截器
     */
    @Override
    public void configInterceptor(Interceptors interceptors) {
        super.configInterceptor(interceptors);
//        interceptors.add( new EncodingInterceptor() );
    }

    /**
     * 配置处理器
     */
    @Override
    public void configHandler(Handlers handlers) {
        super.configHandler(handlers);
    }

    /**
     * JFinal 会在系统启动完成后回调 afterJFinalStart() 方法
     */
    public void afterJFinalStart(){
        ServletContext context = JFinal.me().getServletContext();
//		context.setAttribute("base" , context.getContextPath());

        try {
            FreeMarkerRender.getConfiguration().setSharedVariable("base", context.getContextPath());
        } catch (TemplateModelException e) {
            e.printStackTrace();
        }
//		JFinal.me().getServletContext().setAttribute("contextPath", JFinal.me().getServletContext().getContextPath());
    }

    /**
     * JFinal 会在系统关闭前回 调 beforeJFinalStop()方法
     */
    public void beforeJFinalStop(){

    }
}
