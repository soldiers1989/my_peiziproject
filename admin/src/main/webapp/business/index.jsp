<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="header.jsp"%>
<script type="text/javascript">
var page = new Page();
		$(document).ready(function() {
	        $.ajaxSetup({
	            cache:false,
	            type:"POST",
	            contentType:"application/json",
	            dataType:"json"
	        });
	      //  applyService();
	      $(".treeview  ul  a").click(function(){
	    	  $(".sidebar-menu li").removeClass("active");
	    	  $(this).closest(".treeview").addClass("active");
	    	  $(this).parent().addClass("active") ; 
	    	  
	    	  
	      });
	      var height=$(".main-sidebar").height()*$(".treeview").size();
		   $(".main-sidebar").height(height*0.1);
		   $("#fillName").text(""+"<%=userid%>"+"已登录") ; 
		});
		
		 
    </script>
 <body class="skin-blue">
		<div class="wrapper">
			<%@include file="top.jsp"%>
				<aside class="main-sidebar">
					<section class="sidebar">
						<div class="user-panel">
							<div class="pull-left image">
								<img src="<%=basePath%>/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image" />
							</div>
							<div class="pull-left info">
								<a href="<%=basePath%>/<%=busType%>/managerauth/editpassword.jsp"  target="myFrameName"><i class="fa fa-circle text-success"></i>修改密码</a> <a href="<%=basePath%>/include/signout.jsp"><i class="fa fa-circle text-success"></i>退出</a>
							<br/><br/>
							<p id='fillName'>用户1111</p>
							</div>
						</div>
                    <ul class="sidebar-menu" style="display: none">
                        <li class="treeview"> <a href="#"><i class="fa fa-dashboard"></i><span>用户管理 </span><i class="fa fa-angle-left pull-right"></i></a>
	                        <ul class="treeview-menu">
				  				<li><a href="<%=basePath%>/<%=busType%>/user/list.jsp" target="myFrameName"><i class="fa fa-circle-o"></i> 用户列表</a></li>
	                        </ul>
                        </li>
                        <li class="treeview"> <a href="#"><i class="fa fa-dashboard"></i><span>配资管理 </span><i class="fa fa-angle-left pull-right"></i></a>
	                        <ul class="treeview-menu">
				  				<li><a href="<%=basePath%>/<%=busType%>/peizi/list.jsp" target="myFrameName"><i class="fa fa-circle-o"></i> 配资列表</a></li>
	                        </ul>
                        </li>
                        <li class="treeview"> <a href="#"><i class="fa fa-dashboard"></i><span>记录管理 </span><i class="fa fa-angle-left pull-right"></i></a>
	                        <ul class="treeview-menu">
				  				<li><a href="<%=basePath%>/<%=busType%>/record/inlist.jsp" target="myFrameName"><i class="fa fa-circle-o"></i> 入金列表</a></li>
	                        </ul>
	                        <ul class="treeview-menu">
				  				<li><a href="<%=basePath%>/<%=busType%>/record/outlist.jsp" target="myFrameName"><i class="fa fa-circle-o"></i> 出金列表</a></li>
	                        </ul>
                        </li>
                         <li class="treeview"> <a href="#"><i class="fa fa-dashboard"></i><span>系统管理 </span><i class="fa fa-angle-left pull-right"></i></a>
	                        <ul class="treeview-menu">
				  				<li><a href="<%=basePath%>/<%=busType%>/sysconfig/list.jsp" target="myFrameName"><i class="fa fa-circle-o"></i> 系统配置</a></li>
	                        </ul>
                        </li>
                        <li class="treeview"> 
                        	<a href="#"><i class="fa fa-dashboard"></i><span>权限管理 </span><i class="fa fa-angle-left pull-right"></i></a>
	                        <ul class="treeview-menu">
				  				<li><a href="<%=basePath%>/<%=busType%>/managerauth/newAccount.jsp" target="myFrameName"><i class="fa fa-circle-o"></i> 账号管理 </a></li>
	                            <li><a href="<%=basePath%>/<%=busType%>/managerauth/privileges.jsp" target="myFrameName"><i class="fa fa-circle-o"></i> 权限分配 </a></li>
	                            <li><a href="<%=basePath%>/<%=busType%>/managerauth/accesscontrol.jsp" target="myFrameName"><i class="fa fa-circle-o"></i> 权限设置 </a></li>
	                        </ul>
                        </li> 
                        
                   
                        <!-- Accordion Menu END-->
                    </ul>
                </section>
			<!-- /.sidebar -->
		</aside>
		
        <div class="content-wrapper" >
        <iframe id="myFrameId" name="myFrameName" scrolling="yes" frameborder="0" style='width:100%;height:85%'    ></iframe> 
        <%@include file="../include/footer.jsp"%>
        </div></div>
<script>
/* 	 $(window.parent.document).find("#myFrameId").load(function(){
		var main = $(document).find("#myFrameId");
		 var ifm= document.getElementById("myFrameId");
		  var subWeb = document.frames ? document.frames["myFrameId"].document :ifm.contentDocument;
		var _frame = document.frames["myFrameName"].document; 
		var thisheight = $(subWeb).height()+40;
		main.height(thisheight);
		});  */
		
/* 		  function iFrameHeight() {

	        var ifm= document.getElementById("myFrameId");

	        var subWeb = document.frames ? document.frames["myFrameId"].document :ifm.contentDocument;

	            if(ifm != null && subWeb != null) {
	            	alert(232323) ; 
$(ifm).height($(subWeb).height())) ; 
	           // ifm.height = subWeb.body.scrollHeight;

	            }

	    } */

</script>
<!-- ./wrapper -->
</body>
</html>