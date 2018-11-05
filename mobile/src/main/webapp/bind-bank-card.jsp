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
        绑定银行卡
      </h1>
    </div>
  </div>
  <div class="weui-cells register">
    <%-- <div class="weui-cell">
      <div class="weui-cell__hd">
         <label class="weui-label">客户姓名</label>
      </div>
      <div class="weui-cell__bd">
      <input type="text"
          placeholder="请输入客户姓名" class="weui-input" name="name"
          id="name">
          </div>
    </div> --%>
    <div class="weui-cell">
    <input type="hidden" id="account" name="account" value=""/>
      <div class="weui-cell__hd"><label class="weui-label">
          开户行
        </label></div>
      <div class="weui-cell__bd">
        <input type="text" name="bank" placeholder="请输入开户行"
          class="weui-input" id="bank">
      </div>
    </div>
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label">
          银行卡号
        </label></div>
      <div class="weui-cell__bd">
        <input type="text" name="number" placeholder="请输入银行卡号"
          class="weui-input" id="number">
      </div>
    </div>
    <!-- <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label">推荐人</label></div>
      <div class="weui-cell__bd"><input type="text" placeholder="如果没有，可不填写"
          class="weui-input" name="referrer" id="referrer"></div>
    </div> -->
  </div>
  <div class="weui-btn-area">
    <a class="weui-btn weui-btn_primary" id="submitBtn">绑定</a>
  </div>
  <div class="bind-bank-tips">
    <h2>温馨提示：</h2>
    <ol>
      <li>
        此绑定的银行卡为出金银行卡，请您准确填写个人信息。如果填写有误，造成出金错误，98配资网概不负责。</li>
    </ol>
  </div>




  <script src="./js/libs/require.min.js"></script>
  <script>
    require(['js/bind-bank.js'])
  </script>

</body>
</html>
