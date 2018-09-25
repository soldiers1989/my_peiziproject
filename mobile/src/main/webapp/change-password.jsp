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
        修改密码
      </h1>
    </div>
  </div>
  <div class="weui-cells change-password">
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label">原密码</label></div>
      <div class="weui-cell__bd"><input type="password" id="oldPassword"
          placeholder="请填写密码" class="weui-input"></div>
    </div>
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label">新密码</label></div>
      <div class="weui-cell__bd"><input type="password" id="newPassword"
          placeholder="请填写密码" class="weui-input"></div>
    </div>
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label">确认新密码</label></div>
      <div class="weui-cell__bd"><input type="password" id="confirmPassword"
          placeholder="请填写密码" class="weui-input"></div>
    </div>
  </div>

  <div class="weui-btn-area">
    <a class="weui-btn weui-btn_primary" id="submitBtn">
      确认修改
    </a>
  </div>




  <script src="./js/libs/require.min.js"></script>
  <script>
    require(['js/change-password.js'])
  </script>

</body>
</html>
