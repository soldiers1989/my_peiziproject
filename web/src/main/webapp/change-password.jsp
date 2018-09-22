<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="header.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	if(null == <%=account%>){
		window.location.href="./login.jsp";
	}
	setaccount(<%=account%>);
});


function setaccount(account){
	$("#account").val(account);
}

</script>
  <div class="account container">
    <div class="account-side fl">
      <h1 class="title">我的账户</h1>
      <ul class="side-menu">
        <li>
          <a href="#">
            <i class="fa fa-address-card"></i>
            我的账号
          </a>
          <ul class="sub-menu">
            <li>
              <a href="./account.jsp">个人主页</a>
            </li>
          </ul>
        </li>
        <li>
          <a href="#"><i class="fa fa-credit-card"></i>
            我的资金</a>
          <ul class="sub-menu">
            <li>
              <a href="./recharge.jsp">入金</a>
            </li>
            <li>
              <a href="./withdraw.jsp">出金</a>
            </li>
          </ul>
        </li>
        <li>
          <a href="#"> <i class="fa fa-gear"></i> 系统操作</a>
          <ul class="sub-menu">
            <li class="active">
              <a href="./change-password.jsp">修改密码</a>
            </li>
            <li>
              <a href="./logoutServlet">退出登录</a>
            </li>
          </ul>
        </li>
      </ul>
    </div>
    <div class="account-main fr">
      <h1 class="account-title">修改密码</h1>
      <div class="change-password clearfix">
        <form action="#">
        <input type="hidden" id="account" name="account" value=""/>
          <p class="form-item">
            <label for="">原密码</label>
            <input type="password" name="oldPassword"
              placeholder="请输入原密码" id="oldPassword">
          </p>
          <p class="form-item">
            <label for="">新密码</label>
            <input type="password" id="newPassword"
              placeholder="请输入新密码">
          </p>
          <p class="form-item">
            <label for="">确认新密码</label>
            <input type="password" placeholder="请确认新密码" id="confirmPassword">
          </p>

          <p class="btn-wrapper">
            <button class="btn btn-block btn-primary" id="submitBtn">
              确认修改
            </button>
          </p>

        </form>
      </div>
    </div>
  </div>
 <%@include file="footer.jsp"%> 
<script src="<%=basePath%>/js/libs/require.min.js"></script>
<script>
 require(['js/change-password.js'])
</script>