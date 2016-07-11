/**
 * Description:  我的 datatable  封装
 * 创建日期: 7/8  15:05
 * @author: sjin QQ: 928990049
 */

(function($){

    /**
     * 封装 DataTable 初始化
     * @param options
     * @returns {*}
     */
    $.fn.myDataTable = function(options){
        var $this = this;

        options = $.extend({}, {
            sAjaxSource: "",
            aoColumns: [],
            fnServerParams: function ( aoData ) {},
            fnDrawCallback: function(oSettings) {},
            fnHeaderCallback: function( nHead, aData, iStart, iEnd, aiDisplay ) {},
            fnInitComplete: function (oSettings, json) {},
            oLanguage: {"sUrl": ""}
        }, options);

        var datatable = $this.dataTable({
            "bSort": false, //去掉排序。
            "bStateSave": false, //客户端记录状态，讲状态数据写入cookies
            "bServerSide": true, //异步请求
            "bPaginate": true, //显示分页
            "bProcessing": false, //取消等待提示
            "bLengthChange": true, //不显示“每页显示多少条”的下拉框
            "bRetrieve":true, //允许重新生成表格
            "bAutoWidth": false, //自适应宽度
            "sAjaxSource": options.sAjaxSource,
            "sServerMethod": "GET",
            "bFilter": true,  //过滤功能
            "bInfo": true, //页脚信息
            "iDisplayStart": 0,
            "iDisplayLength": 20,
            "aoColumns": options.aoColumns,
            "sDom": "rt<ip>",
            "fnServerParams": function ( aoData ) {
                options.fnServerParams(aoData);
            },
            "fnDrawCallback": function(oSettings) {
                if($this.find('tr > th:first-child input:checkbox')[0] ){
                    $this.find('tr > th:first-child input:checkbox')[0].checked = false;
                    $this.find('tr > td:first-child input:checkbox').each(function(){
                        this.checked = false;
                    });
                    options.fnDrawCallback(oSettings);
                }
                $this.find("a[data-rel=tooltip]").tooltip({container:'body'});
            },
            "fnHeaderCallback": function( nHead, aData, iStart, iEnd, aiDisplay ) {
                options.fnHeaderCallback( nHead, aData, iStart, iEnd, aiDisplay );
            },
            "fnInitComplete": function (oSettings, json) {
                options.fnInitComplete(oSettings, json);
            },
            "oLanguage": options.oLanguage
        });

        $this.on('click', 'tr > th:first-child input:checkbox' , function(){
            var checked = this.checked;
            $this.find('tr > td:first-child input:checkbox').each(function(){
                this.checked = checked;
            });
        }).on('click', 'tr > td:first-child input:checkbox' , function(){
            var totalCount = $this.find('tr > td:first-child input:checkbox').length;
            var selectCount = $this.find('tr > td:first-child input:checkbox:checked').length;
            $this.find('tr > th:first-child input:checkbox')[0].checked = (totalCount==selectCount);
        });

        datatable.getSelectedData = function(){
            var selectedData = [];
            $this.find('tr > td:first-child input:checkbox:checked').each(function(){
                selectedData.push(datatable.fnGetData($(this).closest('tr')));
            });
            return selectedData;
        };

        return datatable;
    };

})(jQuery);
