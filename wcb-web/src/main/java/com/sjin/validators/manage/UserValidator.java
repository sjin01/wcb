package com.sjin.validators.manage;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
import com.mysql.jdbc.StringUtils;
import com.sjin.model.manage.User;

/**
 * Description: 后台验证 用户表   验证器
 * 创建日期: 4/1  15:12
 *
 * @author: guanshj QQ: 928990049
 */
public class UserValidator extends Validator {
    @Override
    protected void validate(Controller controller) {
        this.setShortCircuit(true); // 遇到一个错误马上返回

        validateRequiredString("user.nickname", "errorMsg", "请输入昵称");
        validateRequiredString("user.password", "errorMsg", "请输入登陆密码");

        String username = controller.getPara("user.username");
        String userid = controller.getPara("user.id");
        if(StringUtils.isNullOrEmpty(userid)) if(!User.dao.usernameNotExist(username)) addError("errorMsg" , "用户名已经存在");

        validateRequiredString("user.username", "errorMsg", "请输入用户名");
    }

    @Override
    protected void handleError(Controller controller) {
        controller.keepModel(User.class);

        String actionKey = getActionKey();
        if (actionKey.equals("/manage/user/save"))
            controller.render("add.html");
        else if (actionKey.equals("/manage/user/update"))
            controller.render("edit.html");
    }
}
