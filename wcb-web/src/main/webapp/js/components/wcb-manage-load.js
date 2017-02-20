/**
 * Created by sjin on 17/2/20.
 */
define(['jquery'], function ($) {

    var $breadcrumbs = $('#breadcrumbs');
    var $sidebar = $('#sidebar');

    var $mainDiv = $('#main-content');

    function loadBreadcrumbs(basePath, path) {
        $breadcrumbs.load(basePath + '/common/breadcrumbs?pathname=' + path);
    }

    function loadSidebar(basePath, path) {
        $sidebar.load(basePath + '/common/nav?pathname=' + path);
    }

    function loadPage(path, data, fn) {
        $mainDiv.load(path, data, fn);
    }

    return {
        loadBreadcrumbs: loadBreadcrumbs,
        loadSidebar: loadSidebar,
        loadPage: loadPage
    };

});