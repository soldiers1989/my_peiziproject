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
            <li class="active">
              <a href="./withdraw.jsp">出金</a>
            </li>
          </ul>
        </li>
        <li>
          <a href="#"> <i class="fa fa-gear"></i> 系统操作</a>
          <ul class="sub-menu">
            <li>
              <a href="./change-password.jsp">修改密码</a>
            </li>
            <li>
              <a href="./logoutServlet">退出登录</a>
            </li>
          </ul>
        </li>
      </ul>
    </div>
    <div class="account-main fr recharge">
      <h1 class="account-title">出金</h1>
      <p class="sub-title">
        请认真填写提现信息
      </p>
      <form action="#" class="withdraw-form">
      <input type="hidden" id="account" name="account" value=""/>
        <p class="form-item">
          <label for="">提现金额</label>
          <input type="text" name="amount" id="amount"
            placeholder="请输入提现金额">
          <span class="error"></span>
        </p>

        <p class="btn-wrapper">
          <button type="button" class="btn btn-block btn-primary"
            id="submitBtn">
            确认提现
          </button>
        </p>
      </form>
      <div class="withdraw-notice">
        <h2>温馨提示：</h2>
        <p> 1.线上出金时间：09:30-15:30（周六日及法定节假日除外）。</p>
        <p>2.线上出金单次最高金额为50000元/次，不限出金次数，第三方支付机构收取2元/次的手续费。</p>
        <p>3.线上出金到账时间最迟15分钟以内，如未能正常到账，请及时联系客服。</p>
        <p>4.刘经理：电话/微信：18612226789 QQ：215772907
          郭经理：电话/微信：18311187611 QQ：761369662</p>
      </div>
    </div>
  </div>
  <%@include file="footer.jsp"%> 
<script src="<%=basePath%>/js/libs/require.min.js"></script>
<script>
 require(['js/withdraw.js'])
</script>
