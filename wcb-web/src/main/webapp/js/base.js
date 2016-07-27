/**
 * requireJS 公用库配置
 */
requirejs.config({
	urlArgs:"v=1.0.0",
	paths: {
	    'jquery': 'lib/jquery/jquery-1.11.1',
        'validate': 'lib/jquery/validate/jquery.validate',
        'validate.zh': 'lib/jquery/validate/messages_zh',
        'validate.additional': 'lib/jquery/validate/additional-methods',
        'validate.myValidate': 'lib/jquery/validate/myValidate'
	},
    map: {
        '*': {
            'css': 'cssMin' // or whatever the path to require-css is
        }
    },
	shim:{
        /*'jquery-iframe-transport':{deps:['jquery']},
        'tinymce':{
            deps:['jquery','jquery-iframe-transport'],
            "exports" : 'tinymce'
        },
        'jquery-pagination':{deps:['jquery']}*/
	}
});
define("base",[
	'jquery',
    'validate',
    'validate.zh',
    'validate.additional'

],function(){});
