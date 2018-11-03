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
<body class="has-hd">
  <!-- 顶部导航栏 -->
  <div class="header">
    <div class="hd-left">
      <a href="javascript:history.back()" class="back-btn">
        <img src="./images/common/back.png" alt="">
      </a>
    </div>
    <div class="hd-center">
      <h1 class="title">
        提现
      </h1>
    </div>
  </div>
  <div class="recharge-content offline" style="display: block;">
  <div class="weui-cells register">
    <!-- <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label">用户名</label></div>
      <div class="weui-cell__bd"><input type="text" placeholder="请填写用户名"
          class="weui-input" name="username" id="username"></div>
    </div> -->
    <div class="weui-cell">
    <input type="hidden" id="account" name="account" value=""/>
      <div class="weui-cell__hd"><label class="weui-label">
          提现金额
        </label></div>
      <div class="weui-cell__bd">
        <input type="number" name="number" placeholder="请输入提现金额"
          class="weui-input" id="withdrawAmount">
      </div>
    </div>
    <!-- <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label">推荐人</label></div>
      <div class="weui-cell__bd"><input type="text" placeholder="如果没有，可不填写"
          class="weui-input" name="referrer" id="referrer"></div>
    </div> -->
  <div class="weui-btn-area">
    <a class="weui-btn weui-btn_primary" id="submitBtn">绑定</a>
  </div>
  </div>
   <div class="tips">
      <h2>温馨提示：</h2>
      <ol>
        <li>1. 线上出金时间：09:30-15:30（周六日及法定节假日除外）。</li>
        <li>2. 线上出金单次最高金额为50000元/次，不限出金次数，第三方支付机构收取2元/次的手续费。</li>
        <li>3. 线上出金到账时间最迟15分钟以内，如未能正常到账，请及时联系客服。</li>
        <li>4. 刘经理：电话/微信：18612226789 QQ：215772907 郭经理：电话/微信：18311187611 QQ：761369662</li>
      </ol>
    </div>
  </div>



  <script src="./js/libs/require.min.js"></script>
  <script>
    require(['js/withdraw.js'])
  </script>

</body>
</html>
