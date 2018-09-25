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
        实名认证
      </h1>
    </div>
  </div>
  <div class="weui-cells login">
  <input type="hidden" id="account" name="account" value=""/>
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label">真实姓名</label></div>
      <div class="weui-cell__bd"><input type="text" id="name"
          placeholder="请填写真实姓名" class="weui-input"></div>
    </div>
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label">身份证号码</label></div>
      <div class="weui-cell__bd"><input type="text" id="code"
          placeholder="请填写身份证号码" class="weui-input"></div>
    </div>
  </div>
  <div class="weui-btn-area">
    <a class="weui-btn weui-btn_primary" id="submitBtn">
      认证
    </a>
  </div>

  <script src="./js/libs/require.min.js"></script>
  <script>
    require(['js/verified.js'])
  </script>
</body>
</html>
