/**
 * Description:   我的验证框架， 错误提示方式
 * 创建日期: 7/8  11:15
 * @author: sjin QQ: 928990049
 */

/**
 *  重写 表单通用    验证框架 错误提示 方式
 **/
$.validator.setDefaults({
    submitHandler: function(from) {  },
    //errorElement: "",
    /*errorPlacement: function(error, element) {
        var navigatorName = "Microsoft Internet Explorer";
        if(navigator.appName == navigatorName){

        }else{

        }
        console.log(element);
    },
    success: function(label) {
        var navigatorName = "Microsoft Internet Explorer";
        if(navigator.appName == navigatorName){

        }
        else{

        }
        console.log(label);
    }*/
    showErrors: function(map, list) {
        var i = 0;
        this.currentElements.removeClass("ui-state-highlight");
        $.each(list, function(index, error) {
            if(i==0){
                //$(error.element).addClass("ui-state-highlight");
                showErrorTxt(error.message , $(error.element));
            }
            i = i+1;
        });
    }

});

function showErrorTxt(errorMessage , errorElement){
    if(!errorMessage){
        return false;   // 错误信息不能为空
    }

    var errorDiv = 'error-alert';

    var _htmlStr = '<div class="alert alert-danger">'+
    '<strong>'+
    '<i class="ace-icon fa fa-times"></i>'+
    ' 错嘎达 ！'+
    '</strong>'+ errorMessage +
    '</div>';

    $("#"+errorDiv).html('');
    $("#"+errorDiv).append(_htmlStr);

    // 如果 发生错误的element 有值，添加 高亮样式
    if(errorElement){
        $(errorElement).addClass('ui-state-highlight');
    }
}
