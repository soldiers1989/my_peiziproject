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
<title>提交记录</title>
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
	         url: RESTFUL_BASE  + "/" + type + "/userrecord/save",
	         type: 'POST',
	         data: {"realname":$("#realname").val(),"phone":$("#phone").val(),"accountbank":$("#accountbank").val()},
             beforeSend:function(){
                 //执行提交前的提交信息验证
                  $("#loginsubmit").hide();
                  return validateForm();
             },
	         dataType: 'json',
	         success: function(data){
	             if(data.resultCode == 1) {
	            	 	$.MsgBox.Alert("提示信息：",data.resultMessage);
			 			$("#loginsubmit").show();
			 			$("#realname").select();
	             } else {
	            	 $.MsgBox.Alert("提示信息：",data.resultMessage);
				}
			}
		});
}

function validateForm() {
	
	if($("#realname").val() == ''){
		alert("姓名不能为空!");
		return false;
	}
	if($("#phone").val() == ''){
		alert("电话不能为空！");
		return false;
	}
	if($("#accountbank").val() == ''){
		alert("请选择所在球迷会！");
		return false;
	}
	return true;
}

function resetform() {
	$("#loginsubmit").show();
	$("#realname").val('');
	$("#phone").val('');
	$("#accountbank").val('');
}
</script>
</head>
<body class="login-page">
	<div class="login-box">
		<div class="login-logo">
			<b></b>
		</div>
		<!-- /.login-logo -->
		<div class="login-box-body">
			<p class="login-box-msg">登记信息</p>
			<form role="form" action="" method="post" id="form">
				<div class="form-group has-feedback">
					<input type="text" class="form-control" id="realname" name="realname" placeholder="姓名"   /> 
				</div>
				<div class="form-group has-feedback">
					<input type="text" class="form-control" id="phone" name="phone" placeholder="电话" /> 
				</div>
				<div class="form-group has-feedback">
					<select id="accountbank" name="accountbank" class="form-control" >
						<option value="">--请选择所在球迷会--</option>
						<option value="东城球迷会">东城球迷会</option>
						<option value="西城球迷会">西城球迷会</option>
						<option value="朝阳球迷会">朝阳球迷会</option>
						<option value="丰台球迷会">丰台球迷会</option>
						<option value="石景山球迷会">石景山球迷会</option>
						<option value="海淀球迷会">海淀球迷会</option>
						<option value="大兴球迷会">大兴球迷会</option>
						<option value="门头沟球迷会">门头沟球迷会</option>
						<option value="房山球迷会">房山球迷会</option>
						<option value="通州球迷会">通州球迷会</option>
						<option value="顺义球迷会">顺义球迷会</option>
						<option value="昌平球迷会">昌平球迷会</option>
						<option value="怀柔球迷会">怀柔球迷会</option>
						<option value="平谷球迷会">平谷球迷会</option>
						<option value="密云球迷会">密云球迷会</option>
						<option value="延庆球迷会">延庆球迷会</option>
						<option value="中关村球迷会">中关村球迷会</option>
						<option value="望京球迷会">望京球迷会</option>
						<option value="金融界球迷会">金融界球迷会</option>
						
					</select>
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