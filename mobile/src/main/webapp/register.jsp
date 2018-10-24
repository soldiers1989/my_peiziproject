<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="header.jsp"%>
<%
	String remdPhone = (String)request.getParameter("remdPhone");
%>
<script type="text/javascript">
$(document).ready(function() {
	if (null != <%=remdPhone%>){
		$("#remdPhone").val(<%=remdPhone%>);
	}
	getuid();
});


function getuid(){
	var RESTFUL_BASE = serviceurl.baseurl;
    $.ajax({
        url: RESTFUL_BASE+"/web/user/getuid",
        type: 'GET',
        dataType: 'text',
        success: function(data){
            $("#uid").val(data);
        }
    });
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
        免费注册
      </h1>
    </div>
  </div>
  <div class="weui-cells register">
    <!-- <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label">用户名</label></div>
      <div class="weui-cell__bd"><input type="text" placeholder="请填写用户名"
          class="weui-input" name="username" id="username"></div>
    </div> -->
    <input type="hidden" id="uid" name="uid" value="">
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label">
          +86
        </label></div>
      <div class="weui-cell__bd"><input type="number" name="mobile"
          placeholder="请输入手机号" class="weui-input" id="mobile"></div>
    </div>
    <div class="weui-cell weui-cell_vcode">
      <div class="weui-cell__hd"><label class="weui-label">获取验证码</label></div>
      <div class="weui-cell__bd"><input type="number"
          minlength="6" maxlength="6" placeholder="请输入验证码"
          class="weui-input" name="vcode" id="vcode"></div>
      <div class="weui-cell__ft">
        <button class="weui-vcode-btn" id="getCodeBtn">获取验证码</button>
      </div>
    </div>
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label">密码</label></div>
      <div class="weui-cell__bd"><input type="password"
          placeholder="请输入密码" class="weui-input" name="password"
          id="password"></div>
    </div>
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label">确认密码</label></div>
      <div class="weui-cell__bd"><input type="password"
          placeholder="请确认密码" class="weui-input" name="confirmPsw"
          id="confirmPsw"></div>
    </div>
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label">推荐人</label></div>
      <div class="weui-cell__bd"><input type="number"
          placeholder="如果没有，可不填写" class="weui-input" name="remdPhone"
          id="remdPhone"></div>
    </div>
    <!-- <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label">推荐人</label></div>
      <div class="weui-cell__bd"><input type="text" placeholder="如果没有，可不填写"
          class="weui-input" name="referrer" id="referrer"></div>
    </div> -->
  </div>
  <span for="weuiAgree" class="weui-agree">
    <input id="weuiAgree" type="checkbox" 
      class="weui-agree__checkbox" >
    <span class="weui-agree__text">
      阅读并同意<a href="./registration-agreement.jsp" target="_blank">注册服务协议
      </a>
    </span>
  </span>
  <div class="weui-btn-area">
    <a class="weui-btn weui-btn_primary" id="registerBtn">同意协议并注册</a>
    <a href="./login.jsp" class="weui-btn weui-btn_default login-btn">已有账号？立即登录</a>
  </div>



  <script src="./js/libs/require.min.js"></script>
  <script>
    require(['js/register.js'])
  </script>

</body>
</html>
