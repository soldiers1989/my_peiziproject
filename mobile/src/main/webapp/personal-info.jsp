<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="header.jsp"%>
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
        个人资料
      </h1>
    </div>
  </div>

  <div class="personal-info">
    <div class="weui-cells">
      <div class="weui-cell">
        <div class="weui-cell__bd">
          <p>用户名</p>
        </div>
        <div class="weui-cell__ft">晒太阳的小乌龟</div>
      </div>
      <a href="./verified.jsp" class="weui-cell weui-cell_access"
        href="javascript:;">
        <div class="weui-cell__bd">
          <p>实名认证</p>
        </div>
        <div class="weui-cell__ft">未认证</div>
      </a>
      <a href="./bind-bank-card.jsp" class="weui-cell weui-cell_access"
        href="javascript:;">
        <div class="weui-cell__bd">
          <p>银行卡号</p>
        </div>
        <div class="weui-cell__ft">未绑定</div>
      </a>
    </div>
  </div>

</body>
</html>
