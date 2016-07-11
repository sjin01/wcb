package com.sjin.model.manage;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.sjin.model.base.BaseSysFunc;

import java.util.List;

/**
 * 功能  t_sys_func
 *
     id                   int not null,
     name                 varchar(45),
     sort                 int,
     path                 varchar(512) comment '访问路径',
     pic                  varchar(512),
     pid                  int,
     type                 int comment '1：菜单；2：功能',
     primary key (id)
 *
 * @author: guanshj QQ: 928990049
 */
public class Func extends BaseSysFunc<Func> {

    public static final Func dao = new Func();

    /**
     * 所有 sql 写在 Model 或 Service 中，不要写在 Controller 中，养成好习惯，有利于大型项目的开发与维护
     */
    public Page<Func> paginate(int pageNumber, int pageSize) {
        return paginate(pageNumber, pageSize, "select * " , " from t_sys_func order by sort asc");
    }

    /**
     * 根据 pid查询 list
     * @param pid
     * @param type
     * @return
     */
    public List<Record> getFuncByPid (int pid ,int type) {
        return Db.find("select * from t_sys_func where pid = " + pid + " and type =" + type + " order by sort ");
    }

    /**
     * 获取 仅支持两级的菜单
     * @return
     */
    public List<Record> getNav () {
        List<Record> list = getFuncByPid(0 , 1);
        if(list !=null && !list.isEmpty()){
            for(Record item : list){
                List<Record> listSon = getFuncByPid(item.getInt("id") , 1);
                item.set("sonList" , listSon);
            }
        }
        return list;
    }

    /**
     * 根据 path 查找一个对象
     * @param path
     * @return
     */
    public Func getFuncByPath (String path){
        List<Func> list = dao.find("select * from t_sys_func where path like '%" + path + "%' ");
        if(list!=null && !list.isEmpty()) return list.get(0);
        return null;
    }

    /**
     * 清理找不到 父级节点的 垃圾数据
     */
    public void clearRubbish(){
        List<Record> idlist = Db.find("select f.id from t_sys_func f where f.pid!=0 and f.pid not in (select f2.id from t_sys_func f2)");

        StringBuilder sb = new StringBuilder();
        sb.append(" delete from t_sys_func where id in ( ");

        for(Record obj : idlist){
            sb.append(obj.getInt("id") + " , ");
        }

        sb.append(" -1 ) ");

        System.out.println(sb.toString());
        Db.update(sb.toString());
    }
}
