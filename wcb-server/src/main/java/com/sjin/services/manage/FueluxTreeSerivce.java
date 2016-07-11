package com.sjin.services.manage;

import com.sjin.services.manage.impl.FueluxTreeSerivceImpl;
import com.sjin.vo.FueluxTreeVo;

import java.util.List;

/**
 * Description: FueluxTree 服务接口
 * 创建日期: 5/6  11:02
 *
 * @author: guanshj QQ: 928990049
 */
public interface FueluxTreeSerivce {

    /**
     * 供外部条用
     */
    public static final FueluxTreeSerivce serivce = new FueluxTreeSerivceImpl();

    /**
     * 功能菜单 树结构 数据
     * @return
     */
    List<FueluxTreeVo> FuncTreeData (Integer pid);
}
