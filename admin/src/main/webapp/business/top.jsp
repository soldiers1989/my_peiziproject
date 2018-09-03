<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<header class="main-header">
	<!-- Logo -->
	<a href="<%=basePath%>/index.jsp" class="logo"><b>业务管理系统</b></a>
	<!-- Header Navbar: style can be found in header.less -->
	<nav class="navbar navbar-static-top" role="navigation">
		<!-- Sidebar toggle button-->
		<a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button"> <span class="sr-only">Toggle navigation</span>
		</a>
		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
				<!-- Messages: style can be found in dropdown.less-->
				<li class="dropdown messages-menu"><a href="#" class="dropdown-toggle" data-toggle="dropdown"> <i class="fa fa-envelope-o"></i> <span  class="label label-success" id="UnreadNum"></span>
				</a>
					<ul class="dropdown-menu">
						<li class="header" id="CountMess"></li>
						<li>
							<ul class="menu" id="MessageId">
							</ul>
						</li>
					</ul></li>
				<li class="dropdown user user-menu"><a href="#" class="dropdown-toggle" data-toggle="dropdown"> <img src="<%=basePath%>/resources/dist/img/user2-160x160.jpg" class="user-image" alt="User Image" /> <span class="hidden-xs"></span>
				</a>
					<ul class="dropdown-menu">
						<!-- User image -->
						<%-- <li class="user-header"><img src="<%=basePath%>/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image" />
							<p>
								<%=username%> <small>注册于 <%=createtime %></small>
							</p></li>
						<!-- Menu Footer-->
						<li class="user-footer">
							<div class="pull-left">
								<a href="<%=basePath%>/user/managerInfo.jsp" class="btn btn-default btn-flat">修改资料</a>
							</div>
							<div class="pull-right">
								<a href="<%=basePath%>/include/signout.jsp" class="btn btn-default btn-flat">退出</a>
							</div>
						</li> --%>
					</ul></li>
			</ul>
		</div>
	</nav>
</header>
</script>