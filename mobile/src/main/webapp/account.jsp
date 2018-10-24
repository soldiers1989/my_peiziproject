<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="header.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	if(null == <%=account%>){
		window.location.href="./login.jsp";
	}
	getamount(<%=account%>);
	$("#loginBtn").click(function(){
		window.location.href="./logoutServlet";
	});

});


function getamount(account){
	var RESTFUL_BASE = serviceurl.baseurl;
    $.ajax({
        url: RESTFUL_BASE+"/web/user/getamount/"+account,
        type: 'GET',
        dataType: 'json',
        success: function(data){
        	if (null == data.account){
        		document.getElementById("account").innerHTML= "提交配资申请，自动分配帐号!";
        	} else {
        		document.getElementById("account").innerHTML=data.account;
        	}
        }
    });
}

</script>
<body class="has-all">
  <!-- 顶部导航栏 -->
  <div class="header">
    <div class="hd-center">
      <h1 class="title">
        我的账户
      </h1>
    </div>
  </div>
  <!-- banner -->
  <div class="swiper-container assets-preview">
    <div class="swiper-wrapper">
      <div class="swiper-slide">
        <p>当前交易帐号</p>
        <h1><span id="account">0</span></h1>
      </div>
      <!-- <div class="swiper-slide">
        <p>配资金额(元)</p>
        <h1>49000</h1>
      </div>
      <div class="swiper-slide">
        <p>保证金(元)</p>
        <h1>98001</h1>
      </div>
      <div class="swiper-slide">
        <p>冻结金额(元)</p>
        <h1>1200</h1>
      </div> -->
    </div>
    <div class="swiper-pagination"></div>
  </div>
  <div class="weui-grids account-grid">
    <a href="./personal-info.jsp" class="weui-grid js_grid">
      <div class="weui-grid__icon">
        <img src="./images/account/m1.png" alt="">
      </div>
      <p class="weui-grid__label">
        个人资料
      </p>
    </a>
    <a href="./recharge-type.jsp" class="weui-grid js_grid">
      <div class="weui-grid__icon">
        <img src="./images/account/m2.png" alt="">
      </div>
      <p class="weui-grid__label">
        入金
      </p>
    </a>
    <a href="./withdraw.jsp" class="weui-grid js_grid">
      <div class="weui-grid__icon">
        <img src="./images/account/m4.png" alt="">
      </div>
      <p class="weui-grid__label">
        出金
      </p>
    </a>
    <a href="./change-password.jsp" class="weui-grid js_grid">
      <div class="weui-grid__icon">
        <img src="./images/account/m3.png" alt="">
      </div>
      <p class="weui-grid__label">
        修改密码
      </p>
    </a>
    <!-- <a href="" class="weui-grid js_grid">
      <div class="weui-grid__icon">
        <img src="./images/account/m5.png" alt="">
      </div>
      <p class="weui-grid__label">
        邀请奖励
      </p>
    </a>
    <a href="" class="weui-grid js_grid">
      <div class="weui-grid__icon">
        <img src="./images/account/m6.png" alt="">
      </div>
      <p class="weui-grid__label">
        交易记录 </p>
    </a>
    <a href="" class="weui-grid js_grid">
      <div class="weui-grid__icon">
        <img src="./images/account/m7.png" alt="">
      </div>
      <p class="weui-grid__label">
        配资指南
      </p>
    </a>
    <a href="" class="weui-grid js_grid">
      <div class="weui-grid__icon">
        <img src="./images/account/m8.png" alt="">
      </div>
      <p class="weui-grid__label">
        新闻中心
      </p>
    </a>
    <a href="" class="weui-grid js_grid">
      <div class="weui-grid__icon">
        <img src="./images/account/m9.png" alt="">
      </div>
      <p class="weui-grid__label">
        站内消息
      </p>
    </a> -->
  </div>

  <div class="weui-btn-area">
    <a class="weui-btn weui-btn_warn" id="loginBtn">
      退出登录
    </a>
  </div>
 <!-- tabbar -->
  <div class="weui-tabbar">
    <a href="./index.jsp" class="weui-tabbar__item">
      <div class="weui-tabbar__icon">
        <img src="./images/tabbar/home-off.png" alt="">
      </div>
      <p class="weui-tabbar__label">首页</p>
    </a>
    <a href="./stock-day.jsp" class="weui-tabbar__item">
      <div class="weui-tabbar__icon">
        <img src="./images/tabbar/stock-off.png" alt="">
      </div>
      <p class="weui-tabbar__label">股票配资</p>
    </a>
    <!-- <a href="javascript:;" class="weui-tabbar__item">
      <div class="weui-tabbar__icon">
        <img src="./images/tabbar/service-off.png" alt="">
      </div>
      <p class="weui-tabbar__label">在线客服</p>
    </a> -->
    <a href="./account.jsp" class="weui-tabbar__item weui-bar__item--on">
      <div class="weui-tabbar__icon">
        <img src="./images/tabbar/account-on.png" alt="">
      </div>
      <p class="weui-tabbar__label">我的账户</p>
    </a>
  </div>
  <script src="./js/libs/require.min.js"></script>
  <script>
    require(['js/account.js'])
  </script>
</body>
</html>


