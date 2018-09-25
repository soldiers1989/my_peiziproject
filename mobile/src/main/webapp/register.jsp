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
  <title>免费注册</title>
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
    <!-- <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label">推荐人</label></div>
      <div class="weui-cell__bd"><input type="text" placeholder="如果没有，可不填写"
          class="weui-input" name="referrer" id="referrer"></div>
    </div> -->
  </div>
  <label for="weuiAgree" class="weui-agree">
    <input id="weuiAgree" type="checkbox" checked="checked"
      class="weui-agree__checkbox" disabled>
    <span class="weui-agree__text">
      阅读并同意<a href="#" target="_blank">《相关条款》
      </a>
    </span>
  </label>
  <div class="weui-btn-area">
    <a class="weui-btn weui-btn_primary" id="registerBtn">同意协议并注册</a>
    <a href="./login.html" class="weui-btn weui-btn_default login-btn">已有账号？立即登录</a>
  </div>



  <script src="./js/libs/require.min.js"></script>
  <script>
    require(['js/register.js'])
  </script>

</body>
</html>
