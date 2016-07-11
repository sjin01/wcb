package com.sjin.services.manage.impl;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.mysql.jdbc.StringUtils;
import com.sjin.services.manage.FueluxTreeSerivce;
import com.sjin.vo.FueluxTreeVo;

import java.util.ArrayList;
import java.util.List;

/**
 * Description: FueluxTree 服务接口 实现类
 * 创建日期: 5/6  11:08
 *
 * @author: guanshj QQ: 928990049
 */
public class FueluxTreeSerivceImpl implements FueluxTreeSerivce{

    @Override
    public List<FueluxTreeVo> FuncTreeData(Integer pid) {

        List<Record> recordList = Db.find("select " +
                "f.id, f.name , f.sort, " +
                "(select count(id) from t_sys_func where pid = f.id) as childcount " +
                "FROM t_sys_func f " +
                "where f.pid = " + pid + " and f.type =1 " +
                "order by f.sort " +
                ";");
        if(recordList == null || recordList.isEmpty()) return null;

        List<FueluxTreeVo> treedata = new ArrayList<FueluxTreeVo>();
        /*FueluxTreeVo root = new FueluxTreeVo();
        root.setId(0);
        root.setName("根目录");
        root.setType("folder");
        root.setSort(1);
        root.setChildcount(2);
        treedata.add(root);*/

        for(Record item : recordList){
            if (item.getInt("id") == null || StringUtils.isNullOrEmpty(item.getStr("name"))) {
                continue;
            }

            FueluxTreeVo vo = new FueluxTreeVo();
            vo.setId( item.getInt("id") );
            vo.setName(item.getStr("name"));
            vo.setSort( item.getInt("sort"));

            long childcount = item.getLong("childcount");
            vo.setChildcount( (int)childcount );
            vo.setType( childcount>0 ?"folder":"item");
            vo.setChildren( childcount > 0 ? true : false);

            treedata.add(vo);
        }

        return treedata;
    }

}
