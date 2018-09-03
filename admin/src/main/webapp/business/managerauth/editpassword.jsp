<%-- 
    Document   : list
    Created on : 2011-1-12, 19:20:51
    Author     : admin
--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="../header.jsp"%>


<script type="text/javascript">
 
var isPwd = 0;
var isNewPwd = 0;
$(document).ready(function()
	{
	    $("button[value='确认']").click(function(){
	            $.ajax({
	                url:serviceurl.baseurl+"/<%=busType%>/manager/editPassword",
	            	data:"{\"newpassword\":\""+$("#newpassword").val() +"\",\"account\":"+'<%=userid%>'+"}",
	            	type: 'POST',
                    contentType:'text/plain',
	                beforeSend:function(){
	                	 return validateForm();
	                },
	                error:function() {
	                    ajaxAccessErrorProcess();
	                },
	                success:function(editpwdinfo) {
	                	 var resultObject= editpwdinfo;
	                	  
	                    //解析json数据,清除form并填充操作结果提示
	                   formSubmitSuccesssTip(editpwdinfo);
					    if(resultObject.resultCode == 0) {
						if($("#operateresult").hasClass("error")){
						    $("#operateresult").removeClass("error").addClass("success").html(resultObject.resultMessage);
						} else {
						    $("#operateresult").addClass("success").html(resultObject.resultMessage);
						}
					    } else {
						if($("#operateresult").hasClass("success")){
						    $("#operateresult").removeClass("success").addClass("error").html(resultObject.resultMessage);
						} else {
						    $("#operateresult").addClass("error").html(resultObject.resultMessage);
						}
					    }
					    $(".notification").show();
					    $("#operateresult").show();
					    alert("修改成功");
					    $("#passwordForm").resetForm();
	                }
	            });
	        });
        
	    
        //绑定表单验证
	  	  $("#currentpassword").live("blur",function(){
	          if(isNullStr($(this).val())){
	        	   showError($(this).parent().children("span.input-notification"),"请输入原密码!");
				    return false;
	          }
	          if($(this).val().length>30){
	              showError($(this).parent().children("span.input-notification").eq(0),"密码不允许超过30个字符!");
	              return false;
	          }else {
		          
			                $.ajax({
			                    url: serviceurl.baseurl + "/<%=busType%>/manager/validatePassword",
			                    type: 'POST',
			                    contentType:'application/x-www-form-urlencoded',
//			                    data:'{currentpassword:'+ "" + $("#currentpassword").val()+ ',account:' + '<%=userid%>'+'}',
			                    data:"currentpassword="+$("#currentpassword").val()+"&account="+'<%=userid%>',
								dataType : 'json',
								success : function(data) {
									var objdata = eval('('+ data+ ')')
								
									if (objdata == 1) {
										
									showSuccess($("#currentpassword").next(),"信息正确,请继续!");
									isPwd = 1;
									}else {
										
										showError(
										$("#currentpassword").parent().children("span.input-notification"),"原密码输入有误,请重新输入!");
										isPwd = 0;

									}
									},
									error : function(data) {
									showError(
									$("#account").parent().children("span.input-notification"),"验证失败!");
									isPwd = 0;
									}
									});

									}
									});

						$("#newpassword").live("blur",function() {
											if (isNullStr($(this).val())) {
												showError($(this).parent().children("span.input-notification"),"请确认新密码!");
											}
											if (!checkpass($(this).val())) {
												showError($(this).parent().children("span.input-notification"),"密码为6-30个数字、字母和符号的组合!");
											} else {
												showSuccess($(this).next(),"信息正确,请继续!");
											}
										});

						$("#confirmpassword").live("blur",function() {
											if (isNullStr($(this).val())) {
												showError($(this).parent().children("span.input-notification"),"请确认密码!");
											} else if ($(this).val() != $("#newpassword").val()) {
												showError($(this).parent().children("span.input-notification"),"两次输入密码不一致!");
												//$(this).focus();
											} else {
												showSuccess($(this).next(),"信息正确,请继续!");
											}
										});
						$("button[value='取消']").click(function() {
							$("#passwordForm").resetForm();
						});
					});

	function validateForm() {
		if (isNullStr($("#currentpassword").val())) {
			alert("请输入原密码!");
			$("#currentpassword").focus();
			return false;
		}

		
		if (isNullStr($("#newpassword").val())) {
			alert("请确认新密码");
			$("#newpassword").focus();
			return false;
		}
		if (!checkpass($("#newpassword").val())) {

			alert("可以输入6-30个大小写的英文字母和特殊字符(~!@#¥%^&*()-+|)首尾输入空格无效");
			$("#newpassword").focus();
			return false;
		}
		if ($("#confirmpassword").val() != $("#newpassword").val()) {
			alert("两次输入密码不一致!");
			$("#confirmpassword").focus();
			return false;
		}
		return true;
	}
	function checkpass(str) {
		var pwdValidat = /^[a-z,A-Z,0-9,~,!,@,#,¥,$,%,^,&,*,(,),-,+,|]{6,30}$/;
		// return (/^[\x00-\x7F]+$/).test(str) && (/[0-9]+/).test(str) && (/[a-zA-Z]+/).test(str);
		return pwdValidat.test(str);
	}
</script>
<!-- Page Head -->


<!-- End .shortcut-buttons-set -->

</head>
<body class="skin-blue">
<!-- End .shortcut-buttons-set -->
<div class="wrapper" style="background: #fff;">
    <!-- Start Content Box -->
    
    <div class="nav-tabs-custom">
    <h5>&nbsp;&nbsp;&nbsp;&nbsp;</h5>
			<h3>
				&nbsp;&nbsp;&nbsp;&nbsp;密码修改 
			</h3>
        
        <ul class="nav nav-tabs pull-right">
            <li class="active"><a href="#tab1" data-toggle="tab">表单</a></li>
            <!-- href must be unique and match the id of target div -->
        </ul>

     <div class="tab-content">
       <div class="tab-pane active" id="tab1">
            <!-- This is the target div. id must match the href of this div's tab
            <div class="notification attention png_bg"> <a href="#" class="close"><img src="../resources/images/icons/cross_grey_small.png" title="Close this notification" alt="close" /></a>
                <div> This is a Content Box. You can put whatever you want in it. By the way, you can close this notification with the top-right cross. </div>
            </div> -->
            <section class="content">
         		<div class="col-xs-12">
           		    <div class="box">
               	       
                        
                       
					
		<div class="tab-pane" id="tab1">
        	<section class="content">
        		<div class="col-md-15">
        			<div class="box box-primary">
        				<div class="box-header">
							
						     </div>
								<div class="box-body" style="height: 68%;">
								 <form  id="passwordForm" method="post">
									
									
						<input type="hidden" id="id" name="id" value="" /> 
						<input type="hidden" id="status" name="status" value="" />
								<div class="form-group">
									<!-- <div style='width: 25%;'>
										<span style='margin-right: 4px; color: #c00;'>*</span>店铺名称 ：
									</div> -->
									<label>原始密码</label>
									<div class="form-inline">
									<input type="password"  id="currentpassword"  name="currentpassword" maxlength="50"  placeholder="*必须项（长度6-12位）" style="width: 50%;" class="form-control" /> 
									<span class="input-notification png_bg"></span>
									</div>
									
								</div>
							<div class="form-group">
									<!-- <div style='width: 25%;'>
										<span style='margin-right: 4px; color: #c00;'>*</span>店铺名称 ：
									</div> -->
									<label>新密码</label>
																		<div class="form-inline">
									
									<input type="password"  id="newpassword"  name="newpassword" maxlength="50"  placeholder="*必须项（长度6-12位）" style="width: 50%;" class="form-control" />
									<span class="input-notification png_bg"></span>
									</div>
								</div>	
							
							<div class="form-group">
									<!-- <div style='width: 25%;'>
										<span style='margin-right: 4px; color: #c00;'>*</span>店铺名称 ：
									</div> -->
									<label>确认密码</label>
																		<div class="form-inline">
									
									<input type="password"  id="confirmpassword"  name="confirmpassword" maxlength="50"  placeholder="*必须项（长度6-12位）" style="width: 50%;" class="form-control" /> 
									<span class="input-notification png_bg"></span>
									</div>
									
								</div>	
					
						</form>
					   </div>
							    <div class="box-footer" style="height: 6%;">
								    <button class="btn btn-primary" type="button" value="确认">确认</button>
                                    <button class="btn btn-primary" type="button"  value="取消">取消</button>
								</div>
							</div>
									<!-- /.box-body -->
        				</div>
        			</div>
       			  </section>
        <!-- End #tab2 -->
   			   </div>
   	        </div>
   	     </div>
    </div>
   			  
   			   
					<!--  .。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。-->
    
</body>
</html>
