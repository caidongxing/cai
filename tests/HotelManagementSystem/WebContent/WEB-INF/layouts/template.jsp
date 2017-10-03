<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<c:set value="${pageContext.request.contextPath}" scope="session"
	var="ctx"></c:set>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8" />
<title><tiles:insertAttribute name="title" ignore="true" />
</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="Mosaddek" name="author" />

<!--[if lt IE 9]>
    <script src='${ctx}/resources/js/html5shiv.js' type='text/javascript'></script>
    <![endif]-->
    

<link href='${ctx}/resources/stylesheets/bootstrap/bootstrap.css' media='all' rel='stylesheet' type='text/css' />
<link href='${ctx}/resources/stylesheets/bootstrap/bootstrap-responsive.css' media='all' rel='stylesheet' type='text/css' />
    
    <!-- / jquery ui -->
    <link href='${ctx}/resources/stylesheets/jquery_ui/jquery-ui-1.10.0.custom.css' media='all' rel='stylesheet' type='text/css' />
    <link href='${ctx}/resources/stylesheets/jquery_ui/jquery.ui.1.10.0.ie.css' media='all' rel='stylesheet' type='text/css' />
    <!-- / switch buttons -->
    <link href='${ctx}/resources/stylesheets/plugins/bootstrap_switch/bootstrap-switch.css' media='all' rel='stylesheet' type='text/css' />
    <!-- / xeditable -->
    <link href='${ctx}/resources/stylesheets/plugins/xeditable/bootstrap-editable.css' media='all' rel='stylesheet' type='text/css' />
    <link href='${ctx}/resources/stylesheets/plugins/common/bootstrap-wysihtml5.css' media='all' rel='stylesheet' type='text/css' />
    <!-- / wysihtml5 (wysywig) -->
    <link href='${ctx}/resources/stylesheets/plugins/common/bootstrap-wysihtml5.css' media='all' rel='stylesheet' type='text/css' />
    <!-- / jquery file upload -->
    <link href='${ctx}/resources/stylesheets/plugins/jquery_fileupload/jquery.fileupload-ui.css' media='all' rel='stylesheet' type='text/css' />
    <!-- / full calendar -->
    <link href='${ctx}/resources/stylesheets/plugins/fullcalendar/fullcalendar.css' media='all' rel='stylesheet' type='text/css' />
    <!-- / select2 -->
    <link href='${ctx}/resources/stylesheets/plugins/select2/select2.css' media='all' rel='stylesheet' type='text/css' />
    <!-- / mention -->
    <link href='${ctx}/resources/stylesheets/plugins/mention/mention.css' media='all' rel='stylesheet' type='text/css' />
    <!-- / tabdrop (responsive tabs) -->
    <link href='${ctx}/resources/stylesheets/plugins/tabdrop/tabdrop.css' media='all' rel='stylesheet' type='text/css' />
    <!-- / jgrowl notifications -->
    <link href='${ctx}/resources/stylesheets/plugins/jgrowl/jquery.jgrowl.min.css' media='all' rel='stylesheet' type='text/css' />
    <!-- / datatables -->
    <link href='${ctx}/resources/stylesheets/plugins/datatables/bootstrap-datatable.css' media='all' rel='stylesheet' type='text/css' />
    <!-- / dynatrees (file trees) -->
    <link href='${ctx}/resources/stylesheets/plugins/dynatree/ui.dynatree.css' media='all' rel='stylesheet' type='text/css' />
    <!-- / color picker -->
    <link href='${ctx}/resources/stylesheets/plugins/bootstrap_colorpicker/bootstrap-colorpicker.css' media='all' rel='stylesheet' type='text/css' />
    <!-- / datetime picker -->
    <link href='${ctx}/resources/stylesheets/plugins/bootstrap_datetimepicker/bootstrap-datetimepicker.min.css' media='all' rel='stylesheet' type='text/css' />
    <!-- / daterange picker) -->
    <link href='${ctx}/resources/stylesheets/plugins/bootstrap_daterangepicker/bootstrap-daterangepicker.css' media='all' rel='stylesheet' type='text/css' />
    <!-- / flags (country flags) -->
    <link href='${ctx}/resources/stylesheets/plugins/flags/flags.css' media='all' rel='stylesheet' type='text/css' />
    <!-- / slider nav (address book) -->
    <link href='${ctx}/resources/stylesheets/plugins/slider_nav/slidernav.css' media='all' rel='stylesheet' type='text/css' />
    <!-- / fuelux (wizard) -->
    <link href='${ctx}/resources/stylesheets/plugins/fuelux/wizard.css' media='all' rel='stylesheet' type='text/css' />
    <!-- / flatty theme -->
    <link href='${ctx}/resources/stylesheets/light-theme.css' id='color-settings-body-color' media='all' rel='stylesheet' type='text/css' />
    <!-- / demo -->
    <link href='${ctx}/resources/stylesheets/demo.css' media='all' rel='stylesheet' type='text/css' />

<style type="text/css">
.price {
	height: 80px;
	width:30%;
	line-height: 60px;
	display: block;
	font-size: 25px;
	text-align: center;
	color: white;
	font-family: Montserrat;
	float: left;
	margin-bottom: 10px;
	margin-left: 10px !important;
	cursor:pointer;	
}
.toolheader {
    background: white;
    padding: 33px 10px;
    margin: -30px 0 26px;
    border-bottom: 1px solid #dddddd;
}
.error{
	color:red;
}
</style>

</head>

<body class='contrast-red '>
	<tiles:insertAttribute name="header" />
	<div id='wrapper'>
		<div id='main-nav-bg'></div>
		<tiles:insertAttribute name="menu" />
		<tiles:insertAttribute name="body" />
	</div>
	<tiles:insertAttribute name="footer" />


<!-- / jquery -->
<script src='${ctx}/resources/javascripts/jquery/jquery.min.js' type='text/javascript'></script>
<!-- / jquery mobile events (for touch and slide) -->
<script src='${ctx}/resources/javascripts/plugins/mobile_events/jquery.mobile-events.min.js' type='text/javascript'></script>

<!-- / jquery migrate (for compatibility with new jquery) -->
<script src='${ctx}/resources/javascripts/jquery/jquery-migrate.min.js' type='text/javascript'></script>

<!-- / jquery ui -->
<script src='${ctx}/resources/javascripts/jquery_ui/jquery-ui.min.js' type='text/javascript'></script>
<!-- / bootstrap -->
<script src='${ctx}/resources/javascripts/bootstrap/bootstrap.min.js' type='text/javascript'></script>
<script src='${ctx}/resources/javascripts/plugins/flot/excanvas.js' type='text/javascript'></script>
<!-- / sparklines -->
<script src='${ctx}/resources/javascripts/plugins/sparklines/jquery.sparkline.min.js' type='text/javascript'></script>
<!-- / flot charts -->
<script src='${ctx}/resources/javascripts/plugins/flot/flot.min.js' type='text/javascript'></script>
<script src='${ctx}/resources/javascripts/plugins/flot/flot.resize.js' type='text/javascript'></script>
<script src='${ctx}/resources/javascripts/plugins/flot/flot.pie.js' type='text/javascript'></script>
<!-- / bootstrap switch -->
<script src='${ctx}/resources/javascripts/plugins/bootstrap_switch/bootstrapSwitch.min.js' type='text/javascript'></script>
<!-- / fullcalendar -->
<script src='${ctx}/resources/javascripts/plugins/fullcalendar/fullcalendar.min.js' type='text/javascript'></script>
<!-- / datatables -->
<script src='${ctx}/resources/javascripts/plugins/datatables/jquery.dataTables.min.js' type='text/javascript'></script>
<script src='${ctx}/resources/javascripts/plugins/datatables/jquery.dataTables.columnFilter.js' type='text/javascript'></script>
<!-- / wysihtml5 -->
<script src='${ctx}/resources/javascripts/plugins/common/wysihtml5.min.js' type='text/javascript'></script>
<script src='${ctx}/resources/javascripts/plugins/common/bootstrap-wysihtml5.js' type='text/javascript'></script>
<!-- / select2 -->
<script src='${ctx}/resources/javascripts/plugins/select2/select2.js' type='text/javascript'></script>
<!-- / color picker -->
<script src='${ctx}/resources/javascripts/plugins/bootstrap_colorpicker/bootstrap-colorpicker.min.js' type='text/javascript'></script>
<!-- / mention -->
<script src='${ctx}/resources/javascripts/plugins/mention/mention.min.js' type='text/javascript'></script>
<!-- / input mask -->
<script src='${ctx}/resources/javascripts/plugins/input_mask/bootstrap-inputmask.min.js' type='text/javascript'></script>
<!-- / fileinput -->
<script src='${ctx}/resources/javascripts/plugins/fileinput/bootstrap-fileinput.js' type='text/javascript'></script>
<!-- / modernizr -->
<script src='${ctx}/resources/javascripts/plugins/modernizr/modernizr.min.js' type='text/javascript'></script>
<!-- / retina -->
<script src='${ctx}/resources/javascripts/plugins/retina/retina.js' type='text/javascript'></script>
<!-- / fileupload -->
<script src='${ctx}/resources/javascripts/plugins/fileupload/tmpl.min.js' type='text/javascript'></script>
<script src='${ctx}/resources/javascripts/plugins/fileupload/load-image.min.js' type='text/javascript'></script>
<script src='${ctx}/resources/javascripts/plugins/fileupload/canvas-to-blob.min.js' type='text/javascript'></script>
<script src='${ctx}/resources/javascripts/plugins/fileupload/jquery.iframe-transport.min.js' type='text/javascript'></script>
<script src='${ctx}/resources/javascripts/plugins/fileupload/jquery.fileupload.min.js' type='text/javascript'></script>
<script src='${ctx}/resources/javascripts/plugins/fileupload/jquery.fileupload-fp.min.js' type='text/javascript'></script>
<script src='${ctx}/resources/javascripts/plugins/fileupload/jquery.fileupload-ui.min.js' type='text/javascript'></script>
<script src='${ctx}/resources/javascripts/plugins/fileupload/jquery.fileupload-init.js' type='text/javascript'></script>
<!-- / timeago -->
<script src='${ctx}/resources/javascripts/plugins/timeago/jquery.timeago.js' type='text/javascript'></script>
<!-- / slimscroll -->
<script src='${ctx}/resources/javascripts/plugins/slimscroll/jquery.slimscroll.min.js' type='text/javascript'></script>
<!-- / autosize (for textareas) -->
<script src='${ctx}/resources/javascripts/plugins/autosize/jquery.autosize-min.js' type='text/javascript'></script>
<!-- / charCount -->
<script src='${ctx}/resources/javascripts/plugins/charCount/charCount.js' type='text/javascript'></script>
<!-- / validate -->
<script src='${ctx}/resources/javascripts/plugins/validate/jquery.validate.min.js' type='text/javascript'></script>
<script src='${ctx}/resources/javascripts/plugins/validate/additional-methods.js' type='text/javascript'></script>
<script src="${ctx}/resources/javascripts/plugins/validate/messages_zh.js" type='text/javascript'></script>

<!-- / naked password -->
<script src='${ctx}/resources/javascripts/plugins/naked_password/naked_password-0.2.4.min.js' type='text/javascript'></script>
<!-- / nestable -->
<script src='${ctx}/resources/javascripts/plugins/nestable/jquery.nestable.js' type='text/javascript'></script>
<!-- / tabdrop -->
<script src='${ctx}/resources/javascripts/plugins/tabdrop/bootstrap-tabdrop.js' type='text/javascript'></script>
<!-- / jgrowl -->
<script src='${ctx}/resources/javascripts/plugins/jgrowl/jquery.jgrowl.min.js' type='text/javascript'></script>
<!-- / bootbox -->
<script src='${ctx}/resources/javascripts/plugins/bootbox/bootbox.min.js' type='text/javascript'></script>
<!-- / inplace editing -->
<script src='${ctx}/resources/javascripts/plugins/xeditable/bootstrap-editable.min.js' type='text/javascript'></script>
<script src='${ctx}/resources/javascripts/plugins/xeditable/wysihtml5.js' type='text/javascript'></script>
<!-- / ckeditor -->
<script src='${ctx}/resources/javascripts/plugins/ckeditor/ckeditor.js' type='text/javascript'></script>
<!-- / filetrees -->
<script src='${ctx}/resources/javascripts/plugins/dynatree/jquery.dynatree.min.js' type='text/javascript'></script>
<!-- / datetime picker -->
<script src='${ctx}/resources/javascripts/plugins/bootstrap_datetimepicker/bootstrap-datetimepicker.js' type='text/javascript'></script>
<!-- / daterange picker -->
<script src='${ctx}/resources/javascripts/plugins/bootstrap_daterangepicker/moment.min.js' type='text/javascript'></script>
<script src='${ctx}/resources/javascripts/plugins/bootstrap_daterangepicker/bootstrap-daterangepicker.js' type='text/javascript'></script>
<!-- / max length -->
<script src='${ctx}/resources/javascripts/plugins/bootstrap_maxlength/bootstrap-maxlength.min.js' type='text/javascript'></script>
<!-- / dropdown hover -->
<script src='${ctx}/resources/javascripts/plugins/bootstrap_hover_dropdown/twitter-bootstrap-hover-dropdown.min.js' type='text/javascript'></script>
<!-- / slider nav (address book) -->
<script src='${ctx}/resources/javascripts/plugins/slider_nav/slidernav-min.js' type='text/javascript'></script>

<script type="text/javascript" src="${ctx}/resources/javascripts/plugins/bootstrap_menu/BootstrapMenu.min.js"></script>

<!-- / fuelux -->
<script src='${ctx}/resources/javascripts/plugins/fuelux/wizard.js' type='text/javascript'></script>
<!-- / flatty theme -->
<script src='${ctx}/resources/javascripts/nav.js' type='text/javascript'></script>
<script src='${ctx}/resources/javascripts/tables.js' type='text/javascript'></script>
<script src='${ctx}/resources/javascripts/theme.js' type='text/javascript'></script>
<!-- / demo -->
<script src='${ctx}/resources/javascripts/demo/jquery.mockjax.js' type='text/javascript'></script>
<script src='${ctx}/resources/javascripts/demo/inplace_editing.js' type='text/javascript'></script>
<script src='${ctx}/resources/javascripts/demo/charts.js' type='text/javascript'></script>
<script src='${ctx}/resources/javascripts/demo/demo.js' type='text/javascript'></script>	
<!-- 日期控件 -->
<script src="${ctx}/resources/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<!-- 弹屏控件 -->
<script src="${ctx}/resources/javascripts/plugins/layer/layer.js" type="text/javascript"></script>

<script type="text/javascript">
 
 function OnloadContent(path){
   var e = window.event;
   //获取事件点击元素
   var targ = e.target;
   if(targ == "" || targ ==null){
     $('#ulList li').removeClass('active');
     targ.parentNode.className = "active";
     $('#panel').addClass('active');
   }
     $.ajax({
	    type : "get",
		async : false,
		url : path,
		cache: false,
		timeout : 2000,
		contentType : "application/json;charset=utf-8;",
		success : function(data) {
		  $('#content').empty();
		  $('#content').append(data);
		},
		error: function(request) {
          $('#content').empty();
		  $('#content').append(data);
        }
	});
 }
 
 function Submit(path){
    $.ajax({
	    cache: true,
        type: "POST",
        url : path,
        data:$('#form').serialize(),// 你的formid
        async: false,
		success : function(data) {
		  $('#content').empty();
		  $('#content').append(data);
		},
		error: function(request) {
          $('#content').empty();
		  $('#content').append(data);
        }
	});
 }
 
 function optionByPath(path){
   layer.confirm('温馨提示，是否继续？', {
     btn: ['确定','取消'] //按钮
   },function(index, layero){
     layer.close(index);//如果设定了yes回调，需进行手工关闭
     $.ajax({
	    type : "get",
		async : false,
		url : path,
		cache: false,
		timeout : 2000,
		contentType : "application/json;charset=utf-8;",
		success : function(data) {
		  $('#content').empty();
		  $('#content').append(data);
		},
		error: function(request) {
          $('#content').empty();
		  $('#content').append(data);
        }
	});
   });
}
 
//返回list界面
 function GoBackList(path){
    $.ajax({
		cache: true,
		type: "POST",
		url : path,
		success : function(data) {
		  $('#content').empty();
		  $('#content').append(data);
		},
		error: function(request) {
          $('#content').empty();
		  $('#content').append(data);
        }
	});
 }
</script>

</body>
</html>
