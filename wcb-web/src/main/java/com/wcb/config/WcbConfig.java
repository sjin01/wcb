package com.wcb.config;

import com.jfinal.config.*;
import com.jfinal.core.JFinal;
import com.jfinal.render.FreeMarkerRender;
import com.jfinal.render.ViewType;
import com.wcb.base.BaseConfig;
import com.wcb.config.routes.BasicdataRoutes;
import com.wcb.config.routes.CommonRoutes;
import com.wcb.config.routes.ManageRoutes;
import com.wcb.config.routes.PayRoutes;
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

        routes.add(new CommonRoutes());
        routes.add(new ManageRoutes());
        routes.add(new BasicdataRoutes());
        routes.add(new PayRoutes());

        /*
        // 前台 和 公共的
        routes.add("/", IndexController.class, "/views/");
        routes.add("/common", CommonController.class, "/views/common");
        routes.add("/login", LoginController.class, "/views/login");

        // 系统管理
        routes.add("/manage/main", ManageIndexController.class, "/views/manage/main");  // 后台工作台
        routes.add("/manage/user", UsersController.class, "/views/manage/user");                // 用户管理
        routes.add("/manage/role", RoleCtrl.class, "/views/manage/role");                           // 角色管理
        routes.add("/manage/func", FuncController.class, "/views/manage/func");                 // 菜单管理

        // 基础数据
        routes.add("/basicdata/equipment", EquipmentController.class, "/views/basicdata/equipment");    // 设备管理
        routes.add("/basicdata/account", AccountController.class, "/views/basicdata/account");              // 账户管理
        routes.add("/basicdata/chargeStandard", ChargeStandard.class, "/views/basicdata/chargeStandard");   // 收费标准维护

        // 缴费管理
        routes.add("/pay", PayCtrl.class, "/views/pay");

        // 暂时没用上的
        routes.add("/manage/dict", DictController.class, "/views/manage/dict");
        routes.add("/manage/usergroup" ,UserGroupController.class, "/views/manage/usergroup");
        */
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
