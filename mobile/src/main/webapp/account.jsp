<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"
    name="viewport" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="./css/libs/weui.min.css">
  <link rel="stylesheet" href="./css/libs/jquery-weui.min.css">
  <link rel="stylesheet" href="./css/main.css">
  <title>账户充值</title>
</head>
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
        <p>当前权益(元)</p>
        <h1>988.89</h1>
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
    <a href="./personal-info.html" class="weui-grid js_grid">
      <div class="weui-grid__icon">
        <img src="./images/account/m1.png" alt="">
      </div>
      <p class="weui-grid__label">
        个人资料
      </p>
    </a>
    <a href="./recharge-type.html" class="weui-grid js_grid">
      <div class="weui-grid__icon">
        <img src="./images/account/m2.png" alt="">
      </div>
      <p class="weui-grid__label">
        入金
      </p>
    </a>
    <a href="./withdraw.html" class="weui-grid js_grid">
      <div class="weui-grid__icon">
        <img src="./images/account/m4.png" alt="">
      </div>
      <p class="weui-grid__label">
        出金
      </p>
    </a>
    <a href="./change-password.html" class="weui-grid js_grid">
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
    <a href="./index.html" class="weui-tabbar__item">
      <div class="weui-tabbar__icon">
        <img src="./images/tabbar/home-off.png" alt="">
      </div>
      <p class="weui-tabbar__label">首页</p>
    </a>
    <a href="./stock-day.html" class="weui-tabbar__item">
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
    <a href="./account.html" class="weui-tabbar__item weui-bar__item--on">
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
