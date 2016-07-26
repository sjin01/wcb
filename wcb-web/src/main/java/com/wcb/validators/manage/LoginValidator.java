package com.wcb.validators.manage;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
import com.wcb.constant.SysConstant;
import com.wcb.enums.UserTypeEnum;
import com.wcb.model.User;

/**
 * Description: 登陆 验证器
 * 创建日期: 4/23  16:03
 *
 * @author: guanshj QQ: 928990049
 */
public class LoginValidator extends Validator {
    @Override
    protected void validate(Controller controller) {
        this.setShortCircuit(true); // 遇到一个错误马上返回

        validateRequiredString("username" , "errorMsg" ,"请填写用户名");
        validateRequiredString("password" , "errorMsg" ,"请填写密码");

        String username = controller.getPara("username");
        String password = controller.getPara("password");
        if(username.length() > 20) addError("errorMsg" , "用户名太长");
        if(username.length() < 2 ) addError("errorMsg" , "用户名太短");

        User loginUser = User.dao.login(username,password);

        if(loginUser == null){
            addError("errorMsg" , "用户名或密码错误！");
        }else{
            controller.setSessionAttr(SysConstant.SESSIONKEY_LOGIN_USER, loginUser);
        }
    }

    @Override
    protected void handleError(Controller controller) {
//        controller.keepModel(User.class);
        controller.keepPara("username");
        controller.keepPara("password");

        /*String actionKey = getActionKey();
        if (actionKey.equals("/manage/login"))*/
        controller.render("login.html");
        /*else if (actionKey.equals("/user/update"))
            controller.render("edit.html");*/
    }
}
