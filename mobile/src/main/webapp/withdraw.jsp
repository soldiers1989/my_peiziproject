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
  <title>提现 </title>
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
        提现
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
          提现金额
        </label></div>
      <div class="weui-cell__bd">
        <input type="number" name="number" placeholder="请输入提现金额"
          class="weui-input" id="withdrawAmount">
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



  <script src="./js/libs/require.min.js"></script>
  <script>
    require(['js/withdraw.js'])
  </script>

</body>
</html>
