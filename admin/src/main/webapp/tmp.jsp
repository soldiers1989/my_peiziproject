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
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>中国邮政储蓄银行北京分行</title>
  <link rel="stylesheet" href="./css/libs/mobileSelect.css">
  <link rel="stylesheet" href="./css/index.css">
  <script type="text/javascript">

$(document).ready(function() {

	
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

<body>

  <div class="app">
    <div class="form-wrapper">
      <form action="/" method="post" class="form" id="form">
        <div class="form-group">
          <input type="text" name="user_name" id="userName" placeholder="姓名">
        </div>
        <div class="form-group">
          <input type="number" name="mobile" id="mobile" placeholder="手机号码">
        </div>
        <div class="form-group">
          <input type="text" placeholder="所在球迷会" id="subbranch" readonly>
        </div>
        <div class="form-group btn-wrapper">
          <button class="submit-btn">确认提交</button>
        </div>
      </form>
    </div>
  </div>
  <div class="tips">
  </div>

  <script src="<%=basePath%>/js/libs/jquery.min.js"></script>
  <script src="<%=basePath%>/js/libs/mobileSelect.min.js"></script>
  <script src="<%=basePath%>/js/index.js"></script>
  <script src="<%=basePath%>/resources/plugins/jQuery/jQuery-2.1.3.min.js"></script>
</body>

</html>