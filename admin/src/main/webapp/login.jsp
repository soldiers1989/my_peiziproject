<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
  	String basePath = request.getContextPath();
	String curPage = request.getRequestURI();
	String queryStr = request.getQueryString();
	// 如果有请求参数，则加上请求参数
	if (null != queryStr && queryStr.length() > 0) {
		queryStr = curPage + "?" + queryStr;
	} else {
		queryStr = curPage;
	}
%>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>业务管理系统</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<link href="<%=basePath%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>/resources/plugins/iCheck/square/blue.css" rel="stylesheet" type="text/css" />
	<!-- jQuery 2.1.3 -->
	<script src="<%=basePath%>/resources/plugins/jQuery/jQuery-2.1.3.min.js"></script>
	<!-- Bootstrap 3.3.2 JS -->
	<script src="<%=basePath%>/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<!-- iCheck -->
	<script src="<%=basePath%>/resources/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
	<!-- form 表单验证 -->
	<script src='<%=basePath%>/resources/plugins/jQuery/jquery.validate.js'></script>
	<script src='<%=basePath%>/resources/plugins/jQuery/messages_zh.js'></script>
	<!-- method tools -->
	<script src="<%=basePath%>/resources/util/tools.js" type="text/javascript"></script>
	<!-- 自定义congfirm、alert -->
	<script src="<%=basePath%>/resources/msgBox/MsgBox.js"></script>
<script type="text/javascript">

$(document).ready(function() {

	$.MsgBox.Init() ; 
	$('#form').validate({
		rules : {
			account : {
				required : true,
				maxlength : 50,
			},
			password : {
				required : true,
				maxlength : 32,
			},
		},  
		highlight : function(element) {
			$(element).closest('.form-group').addClass('has-error');
		},  
		success : function(label) {  
	    	label.closest('.form-group').removeClass('has-error');  
	    	label.remove();  
	    },  
	    errorPlacement : function(error, element) {  
	        element.parent('div').append(error);  
	    },
	    submitHandler: function() {
	    	login($('#type').val());
	    }
	});
});



function login(type){
	var RESTFUL_BASE = serviceurl.baseurl;
     $.ajax({
	         url: RESTFUL_BASE  + "/" + type +  "/manager/login",
	         type: 'POST',
	         data: {"account":$("#account").val(),"password":$("#password").val(),"type":$("#type").val()},
             beforeSend:function(){
                 //执行提交前的提交信息验证
                  $("#loginsubmit").hide();
             },
	         dataType: 'json',
	         success: function(data){
	             if(data.resultCode == 1) {
	            	 	$.MsgBox.Alert("登陆失败",data.resultMessage);
			 			$("#loginsubmit").show();
			 			$("#account").select();
	             } else {
	            	 window.location.href = "<%=basePath%>/loginservlet?account=" + $("#account").val() + "&type=" + type;
				}
			}
		});
}

function resetform() {
	$("#loginsubmit").show();
	$("#account").val('');//应用信息表单重置        
	$("#password").val('');//应用信息表单重置     
}
</script>
</head>
<body class="login-page">
	<div class="login-box">
		<div class="login-logo">
			<b>业务管理系统</b>
		</div>
		<!-- /.login-logo -->
		<div class="login-box-body">
			<p class="login-box-msg">欢迎回来</p>
			<form role="form" action="" method="post" id="form">
				<div class="form-group has-feedback">
					<input type="text" class="form-control" id="account" name="account" placeholder="请输入用户名"   /> 
					<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control" id="password" name="password" placeholder="请输入密码" /> 
					<span class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="hidden"  id="type" name="type" value="business"/>
					
				</div>
				
				
				
				<div class="row">
					<div class="col-xs-4">
					<button id="btn-login" type="submit"  style='display:inline-block;'  class="btn btn-primary btn-block btn-flat">登录</button>
					</div>
					<div class="col-xs-4">					
						<button type='button'   style='display:inline-block;'  class="btn btn-primary btn-block btn-flat"  onclick="javascript:resetform()" >重置</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>