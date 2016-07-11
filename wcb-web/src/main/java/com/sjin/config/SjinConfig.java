package com.sjin.config;

import com.jfinal.config.*;
import com.jfinal.core.JFinal;
import com.jfinal.render.FreeMarkerRender;
import com.jfinal.render.ViewType;
import com.sjin.base.BaseConfig;
import com.sjin.controllers.manage.ssq.AnalyzeController;
import com.sjin.controllers.manage.ssq.SsqController;
import com.sjin.controllers.timeline.TimelineController;
import com.sjin.controllers.index.IndexController;
import com.sjin.controllers.manage.*;
import freemarker.template.TemplateModelException;

import javax.servlet.ServletContext;

/**
 * Description:  API引导式配置
 * 创建日期: 4/2  9:49
 *
 * @author: guanshj QQ: 928990049
 */
public class SjinConfig extends BaseConfig {

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
        routes.add("/timeline", TimelineController.class);

        // 后台 manage
        routes.add("/manage/login", LoginController.class);
        routes.add("/manage/main", ManageIndexController.class);
        routes.add("/manage/common", CommonController.class);

        routes.add("/manage/user", UsersController.class);
        routes.add("/manage/usergroup" ,UserGroupController.class);
        routes.add("/manage/func", FuncController.class);
        routes.add("/manage/dict", DictController.class);
        routes.add("/manage/ssq/record", SsqController.class);
        routes.add("/manage/ssq/analyze", AnalyzeController.class);

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
