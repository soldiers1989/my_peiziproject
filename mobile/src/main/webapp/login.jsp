<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;"
    name="viewport" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="./css/libs/weui.min.css">
  <link rel="stylesheet" href="./css/libs/jquery-weui.min.css">
  <link rel="stylesheet" href="./css/main.css">
  <title>登录</title>
</head>
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
        登录
      </h1>
    </div>
  </div>
  <div class="weui-cells login">
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label">用户名</label></div>
      <div class="weui-cell__bd"><input type="number" id="mobile"
          placeholder="请填写手机号码" class="weui-input"></div>
    </div>
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label">密码</label></div>
      <div class="weui-cell__bd"><input type="password" id="password"
          placeholder="请填写密码" class="weui-input"></div>
    </div>
  </div>
  <div class="weui-flex weui-cells__title login-other">
    <a href="./register.html" class="link-left">新用户注册</a>
    <a href="./find-password.html" class="link-right">忘记密码？</a>
  </div>

  <div class="weui-btn-area">
    <a class="weui-btn weui-btn_primary" id="loginBtn">
      登录
    </a>
  </div>




  <script src="./js/libs/require.min.js"></script>
  <script>
    require(['js/login'])
  </script>

</body>
</html>
