package com.sjin.vo;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

import java.util.List;

/**
 * Description:  测试自定义sql  和查询字段
 * 创建日期: 4/1  16:39
 *
 * @author: guanshj QQ: 928990049
 */
public class Test {

    public static final Test dao = new Test();

    public List<Record> test(){
        return Db.find("select username ,'393' as username2 from t_sys_user order by id asc");
    }
}
