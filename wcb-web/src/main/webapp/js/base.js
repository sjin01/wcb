/**
 * requireJS 公用库配置
 */
requirejs.config({
	urlArgs:"v=1.0.0",
    baseUrl: "/js",
	paths: {

	    'jquery': 'jquery.min',
        'bs': '/plugin/ace/js/bootstrap.min',

        'ace': '/plugin/ace/js/ace.min',
        'ace-elements': '/plugin/ace/js/ace-elements.min',

        'jquery-ui': '/plugin/ace/js/jquery-ui.min',
        'jquery-ui-custom': '/plugin/ace/js/jquery-ui.custom.min',
        'jquery-ui-touch-punch': '/plugin/ace/js/jquery.ui.touch-punch.min',

        'jquery-chosen': '/plugin/ace/js/chosen.jquery.min',
        'bs-fuelux-spinner': '/plugin/ace/js/fuelux/fuelux.spinner.min',

        // date-time
        'bs-datepicker': '/plugin/ace/js/date-time/bootstrap-datepicker.min',
        'bs-timepicker': '/plugin/ace/js/date-time/bootstrap-timepicker.min',
        'bs-moment': '/plugin/ace/js/date-time/moment.min',
        'bs-daterangepicker': '/plugin/ace/js/date-time/daterangepicker.min',
        'bs-datetimepicker': '/plugin/ace/js/date-time/bootstrap-datetimepicker.min',

        // color picker
        'bs-colorpicker': '/plugin/ace/js/bootstrap-colorpicker.min',

        'jquery-knob': '/plugin/ace/js/jquery.knob.min',
        'jquery-autosize': '/plugin/ace/js/jquery.autosize.min',
        'jquery-inputlimiter': '/plugin/ace/js/jquery.inputlimiter.1.3.1.min',
        'jquery-maskedinput': '/plugin/ace/js/jquery.maskedinput.min',
        'bs-tag': '/plugin/ace/js/bootstrap-tag.min',
        'jquery-typeahead': '/plugin/ace/js/typeahead.jquery.min',

        // data tables
        'jquery-dataTables': '/plugin/ace/js/jquery.dataTables.min',
        'jquery-dataTables-bootstrap': '/plugin/ace/js/jquery.dataTables.bootstrap',

        'bs-fuelux-tree-sample-demo-data': '/plugin/ace/js/fuelux/data/fuelux.tree-sample-demo-data',
        'bs-fuelux-tree': '/plugin/ace/js/fuelux/fuelux.tree.min',
        'bs-bootbox': '/plugin/ace/js/bootbox.min',

        'cssMin':'css.min'
	},
    map: {
        '*': {
            'css': 'cssMin'
        }
    },
	shim:{
        'bs':{deps:['jquery', 'css!/plugin/ace/css/bootstrap.min.css', 'css!/plugin/ace/css/font-awesome.min.css']},
        'ace':{deps:['jquery', 'css!/plugin/ace/css/ace-fonts.css', 'css!/plugin/ace/css/ace.min.css']},
        'ace-elements':{deps:['jquery']},
        'jquery-ui':{deps:['jquery']},
        'jquery-ui-custom':{deps:['jquery']},
        'jquery-ui-touch-punch':{deps:['jquery']},
        'jquery-chosen':{deps:['jquery']},
        'bs-fuelux-spinner':{deps:['jquery']},
        'bs-datepicker':{deps:['jquery']},
        'bs-timepicker':{deps:['jquery']},
        'bs-moment':{deps:['jquery']},
        'bs-daterangepicker':{deps:['jquery']},
        'bs-datetimepicker':{deps:['jquery']},
        'bs-colorpicker':{deps:['jquery']},
        'jquery-knob':{deps:['jquery']},
        'jquery-autosize':{deps:['jquery']},
        'jquery-inputlimiter':{deps:['jquery']},
        'jquery-maskedinput':{deps:['jquery']},
        'bs-tag':{deps:['jquery']},
        'jquery-typeahead':{deps:['jquery']},
        'jquery-dataTables':{deps:['jquery']},
        'jquery-dataTables-bootstrap':{deps:['jquery', 'jquery-dataTables']},
        'bs-fuelux-tree-sample-demo-data':{deps:['jquery']},
        'bs-fuelux-tree':{deps:['jquery']},
        'bs-bootbox':{deps:['jquery']}
	}
});

var bsAll = ['jquery', 'bs', 'ace', 'ace-elements', 'jquery-ui', 'jquery-ui-custom', 'jquery-ui-touch-punch',
    'jquery-chosen', 'bs-fuelux-spinner', 'bs-datepicker', 'bs-timepicker', 'bs-moment', 'bs-daterangepicker', 'bs-datetimepicker',
    'bs-colorpicker', 'jquery-knob', 'jquery-autosize', 'jquery-inputlimiter', 'jquery-maskedinput', 'bs-tag', 'jquery-typeahead',
    'jquery-dataTables-bootstrap', 'bs-fuelux-tree-sample-demo-data', 'bs-fuelux-tree', 'bs-bootbox'];
define("base", bsAll, function(){});

