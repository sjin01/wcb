/**
 * Description:  后台管理 公告 JS代码
 * 创建日期: 5/4  14:28
 * @author: sjin QQ: 928990049
 */

/**
 * init
 */
$(function (){
    $(document).on('click', 'th input:checkbox', function () {
        var that = this;
        $(this).closest('table').find('tr > td:first-child input:checkbox')
            .each(function () {
                this.checked = that.checked;
                $(this).closest('tr').toggleClass('selected');
            });
    });

    $('[data-rel=tooltip]').tooltip({container:'body'});
})

/*function myBootbox (option) {
    this.title = option.title;
    this.message = option.message;
    this.title = option.title;
    this.title = option.title;
}*/


function myConfirm (confirmStr , callback ,btnname1 ,btnname2){
    if(!callback){
        callback = function (){};
    }
    if(!btnname1){ btnname1 = '要得咯';}
    if(!btnname2){ btnname2 = '等哈着';}
    bootbox.confirm({
        title : '<span style="color:#6fb3e0;">操作提示</span>',
        message: confirmStr,
        buttons: {
            confirm: {
                label: btnname1,
                className: "btn-primary btn-xs"
            },
            cancel: {
                label: btnname2,
                className: "btn-xs"
            }
        },
        callback: function(result) {
            if(result) callback();
        }
    });
}

function myConfirmTwo (confirmStr,callback,callmain ,btnname1 ,btnname2){
    if(!callback){
        callback = function (){};
    }
    if(!callmain){
        callmain = function (){};
    }
    if(!btnname1){ btnname1 = '是滴嘞';}
    if(!btnname2){ btnname2 = '算哒';}
    bootbox.confirm({
        title : '<span style="color:#6fb3e0;">操作提示</span>',
        message: confirmStr,
        buttons: {
            confirm: {
                label: btnname1,
                className: "btn-primary btn-xs"
            },
            cancel: {
                label: btnname2,
                className: "btn-xs"
            }
        },
        callback: function(result) {
            if(result){
                callback();
            }else{
                callmain();
            }
        }
    });
}

/**
 * jquery gritter
 * 使用前 先引入 js
 *
 <script src="$contextPath/ace/js/jquery.gritter.min.js"></script>
 ***/
/**
 * jquery gritter  ---------------   成功
 * 参数描述：
 * content 内容： 必填  title 标题：默认 = 操作提示  time 定时消失： 默认1000 单位毫秒
 * #* location 位置： 默认右上， 1：中间 *#
 */
function myGritterSuccess(content , title , time ) {
    if(title == null || title==''){ title = '操作提示'; }
    if(time == null || time==''){ time = 1000; }
    $.gritter.add({
        title: title,
        text: content,
        time: time,
        class_name: 'gritter-success gritter-center gritter-light '
    });
}
/**
 * jquery gritter  ---------------   错误
 * 参数描述：
 * content 内容：必填    title 标题：默认=错误提示    time 定时消失： 默认1000 单位毫秒
 */
function myGritterError(content , title , time ) {
    if(title == null || title==''){ title = '错误提示'; }
    if(time == null || time==''){ time = 1000; }
    $.gritter.add({
        title: title,
        text: content,
        time: time,
        class_name: 'gritter-error gritter-center gritter-light'
    });
}

/**
 * 应用场景： 完成   一个操作提交之后，不允许流在该页面，但又需要提示用户
 * 提示操作成功，并 多少秒内跳转
 */
function myFinishAndTurn (title , message , url){

    var close_Interval;

    var messageHtml = '<div class="modal-header">'+
        '<h4 class="modal-title green">' + title+ '</h4>' +
        '</div> '+
        '<div class="modal-body"> '+
        '<div class="bootbox-body"> '+
        message+ ' <span class="red2" id="close_countdown">5</span> 秒后跳转...' +
        '</div>'+
        '</div>';

    bootbox.dialog({
        message: messageHtml,
        buttons:
        {
            "success" :
            {
                "label" : "<i class='ace-icon fa fa-check'></i> 马上跳转",
                "className" : "btn-sm btn-success",
                "callback": function() {
                    // console.log('马上跳转');
                    clearInterval( close_Interval );
                    location.href = url;
                }
            }
        }
    });

    $(".bootbox-close-button").remove();   // 移除 弹出框的 关闭按钮，

    close_Interval = setInterval(function(){
        var cur = $("#close_countdown").html();
        var next = parseInt(cur) - 1 ;

        $("#close_countdown").html(next);
        if(next == 0){
            //console.log('自动跳转');
            clearInterval( close_Interval );
            location.href = url;
        }
    } ,1000);
}

/**
 * 应用场景： 完成   一个操作提交之后，不允许流在该页面，但又需要提示用户
 * 提示操作成功，并 多少秒内跳转
 */
function myFinishAndTurnFn (title , message , fn){
    var close_Interval;
    var messageHtml = '<div class="modal-header">'+
        '<h4 class="modal-title green">' + title+ '</h4>' +
        '</div> '+
        '<div class="modal-body"> '+
        '<div class="bootbox-body"> '+
        message+ ' <span class="red2" id="close_countdown">5</span> 秒后跳转...' +
        '</div>'+
        '</div>';
    bootbox.dialog({
        message: messageHtml,
        buttons:
        {
            "success" :
            {
                "label" : "<i class='ace-icon fa fa-check'></i> 马上跳转",
                "className" : "btn-sm btn-success",
                "callback": function() {
                    // console.log('马上跳转');
                    clearInterval( close_Interval );
                    fn();
                }
            }
        }
    });
    $(".bootbox-close-button").remove();   // 移除 弹出框的 关闭按钮，
    close_Interval = setInterval(function(){
        var cur = $("#close_countdown").html();
        var next = parseInt(cur) - 1 ;

        $("#close_countdown").html(next);
        if(next == 0){
            //console.log('自动跳转');
            clearInterval( close_Interval );
            fn();
        }
    } ,1000);
}