package com.wcb.base;

import com.jfinal.config.*;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.wcb.model.manage.*;
import com.wcb.model.basicdata.*;

/**
 * Description: API引导式配置
 * 创建日期: 4/2  9:52
 * @author: guanshj QQ: 928990049
 */
public class BaseConfig extends JFinalConfig {

    /**
     * 配置常量
     */
    @Override
    public void configConstant(Constants constants) {
        // 加载少量必要配置，随后可用getProperty(...)获取值
        loadPropertyFile("jdbc.properties");
        constants.setDevMode( getPropertyToBoolean("devMode", false));

        //后面两个参数根据自己情况添加默认语言国家
//        I18N.init("sjin", null, null);
    }

    /**
     * 配置路由
     */
    @Override
    public void configRoute(Routes routes) {

    }

    /**
     * 配置插件
     */
    @Override
    public void configPlugin(Plugins plugins) {
        // 配置C3p0数据库连接池插件
        C3p0Plugin c3p0Plugin = new C3p0Plugin(getProperty("jdbcUrl"), getProperty("user"), getProperty("password").trim());
        plugins.add(c3p0Plugin);

        // 配置ActiveRecord插件
        ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
        plugins.add(arp);

        // 映射 DB table 表到 model
        arp.addMapping("t_sys_dict", Dict.class);
        arp.addMapping("t_sys_func", Func.class);
        arp.addMapping("t_sys_role", Role.class);
        arp.addMapping("t_sys_role_func", RoleFunc.class);
        arp.addMapping("t_sys_user", User.class);
        arp.addMapping("t_sys_user_group", UserGroup.class);
        arp.addMapping("t_sys_user_role", UserRole.class);

        arp.addMapping("t_account", "id", Account.class);
        arp.addMapping("t_account_equipment", "id", AccountEquipment.class);
        arp.addMapping("t_community", "id", Community.class);
        arp.addMapping("t_district", "id", District.class);
        arp.addMapping("t_district_user", "id", DistrictUser.class);
        arp.addMapping("t_equipment", "id", Equipment.class);
        arp.addMapping("t_prov_city_area_street", "id", ProvCityAreaStreet.class);
        arp.addMapping("t_record_pay", "id", RecordPay.class);
        arp.addMapping("t_record_survey", "id", RecordSurvey.class);
    }

    /**
     * 配置全局拦截器
     */
    @Override
    public void configInterceptor(Interceptors interceptors) {

    }

    /**
     * 配置处理器
     */
    @Override
    public void configHandler(Handlers handlers) {

    }

    /**
     * JFinal 会在系统启动完成后回调 afterJFinalStart() 方法
     */
    public void afterJFinalStart(){

    }

    /**
     * JFinal 会在系统关闭前回 调 beforeJFinalStop()方法
     */
    public void beforeJFinalStop(){

    }
}
