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
            <li class="active">
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
      <h1 class="account-title">入金</h1>
      <div class="tabs recharge-tabs">

        
          <div class="tab-content offline" >
            <form action="#" class="offline-recharge-form">
            <input type="hidden" id="account" name="account" value=""/>
              <p class="form-item">
                <label for="">充值金额</label>
                <input type="text" id="rechargeAmount"
                  placeholder="请输入充值金额">
                <span class="error"></span>
              </p>
              <p class="form-item">
                <label for="">选择银行</label>
                <select name="bankCode" id="bankCode">
                  <option value="01020000">中国工商银行</option>
                  <option value="01050000">中国建设银行</option>
                  <option value="01030000">中国农业银行</option>
                  <option value="01040000">中国银行</option>
                  <option value="04012900">上海银行</option>
                  <option value="04031000">北京银行</option>
                </select>
                <span class="error"></span>
              </p>

              <p class="btn-wrapper">
                <button type="button" class="btn btn-block btn-primary"
                  id="submitBtn">
                  确认充值
                </button>
              </p>
            </form>
            <div class="recharge-notice">
              <h2>温馨提示：</h2>
              <p>1.	线上入金时间：08:30-17:30 20:30-03:00（周六日及法定节假日除外）。</p>
              <p>2.	线上入金时，第三方支付机构收取0.3%的手续费。</p>
              <p>3.	如入金金额较大，可联系客服线下入金（线下入金无任何手续费，且不影响线上出金功能的正常使用）。</p>
              <p>4.	刘经理：电话/微信：18612226789 QQ：215772907
	郭经理：电话/微信：18311187611 QQ：761369662</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
<%@include file="footer.jsp"%> 
<script src="<%=basePath%>/js/libs/require.min.js"></script>
<script>
 require(['js/recharge.js'])
</script>
