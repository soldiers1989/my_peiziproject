<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="header.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	if(null == <%=account%>){
		$("#input").val("http://www.98peizi.com/register.jsp");
	} else {
		$("#input").val("http://www.98peizi.com/register.jsp?remdPhone=" + <%=account%>);
	}
	
});
</script>
<body class="has-hd share">
  <!-- 顶部导航栏 -->
  <div class="header">
    <div class="hd-left">
      <a href="javascript:history.back()" class="back-btn">
        <img src="./images/common/back.png" alt="">
      </a>
    </div>
    <div class="hd-center">
      <h1 class="title">
        我要推广
      </h1>
    </div>
  </div>
  <div class="share-box">
    <div class="share-title">
      <img src="./images/share/title.png" alt="">
    </div>
    <p class="info">
      您可以通过朋友、QQ、微信、博客、论坛或自己的网站推广您的专属链接，所有通过该链接访问过来的人，注册后都属于您的用户，而当这些用户在本站配资时，您就可以赚取管理费50%的佣金，详细的推广情况可到邀请奖励记录查看。
    </p>
    <div class="bg-head">
      <img src="./images/share/head.png" alt="">
    </div>

    <div class="purse">
      <img src="./images/share/purse.png" alt="">
    </div>
    <div class="character">
      <img src="./images/share/character.png" alt="">
    </div>
    <div class="share-link">
      <!-- <h4><a href="./login.jsp">登录</a> 后生成您的专属分享链接</h4> -->
      <input type="text" id="input" readonly value="">
      <div class="weui-btn-area">
        <button class="weui-btn weui-btn_mini weui-btn_primary" id="copyBtn"  data-clipboard-target="#input">点击复制您的推广链接</button>
      </div>
    </div>
  </div>
  <script src="./js/libs/require.min.js"></script>
  <script>
    require(['js/share.js'])
  </script>

</body>
</html>
