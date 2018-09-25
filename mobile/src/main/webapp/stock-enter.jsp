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
  <title>确认支付</title>
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
        确认支付
      </h1>
    </div>
  </div>

  <div class="weui-cells">
    <div class="weui-cell">
      <div class="weui-cell__bd">
        <p>付款金额</p>
      </div>
      <div class="weui-cell__ft">¥ <span class="price" id="total">100.2</span></div>
    </div>
    <div class="weui-cell">
      <div class="weui-cell__bd">
        <p>保证金</p>
      </div>
      <div class="weui-cell__ft">¥ <span class="price" id="margin">100</span></div>
    </div>
    <div class="weui-cell">
      <div class="weui-cell__bd">
        <p>利息</p>
      </div>
      <div class="weui-cell__ft">¥ <span class="price" id="interest">0.2</span></div>
    </div>
    <div class="weui-cell">
      <div class="weui-cell__bd">
        <p>操盘期限</p>
      </div>
      <div class="weui-cell__ft"><span class="startDate price"
          id="deadline">2天</span></div>
    </div>
  </div>
  <div class="weui-btn-area">
    <a class="weui-btn weui-btn_primary" id="submitBtn">
      确认配资
    </a>
  </div>



  <script src="./js/libs/require.min.js"></script>
  <script>
    require(['js/stock-enter'])
  </script>

</body>
</html>
