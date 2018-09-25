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
  <title>选择充值方式</title>
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
        入金
      </h1>
    </div>
  </div>

  <div class="weui-flex tabs">
    <a href="./stock-free.html" class="weui-flex__item active"
      data-target="quick">
      <span>快捷支付</span>
    </a>
    <a href="javascript:;" class="weui-flex__item"
      data-target="offline">
      <span>线下支付</span>
    </a>
    <a href="http://lcppay.com/a/payment/paymentInfo/money?account=NTc3MTAwMQl"
      class="weui-flex__item">
      <span>第三方支付</span>
    </a>
  </div>

  <div class="recharge-content quick">
    <div class="recharge-qrcode">
      <img src="./images/account/alipay.jpg" alt="">
      <p>支付宝支付</p>
    </div>
    <div class="recharge-qrcode">
      <img src="./images/account/wepay.jpg" alt="">
      <p>微信支付</p>
    </div>

    <div class="tips">
      <h2>温馨提示：</h2>
      <ol>
        <li>1. 请仔细确认充值金额与账单流水号！</li>
        <li>2. 请您根据自身真实情况填写，98配资网会对用户的所有资料进行严格保密。</li>
        <li>3. 使用过程中遇到问题，请及时联系客服。郭经理：电话/微信：18311187611
          QQ：761369662 刘经理：电话/微信：18612226789 QQ ：215772907</li>
      </ol>
    </div>
  </div>
  <div class="recharge-content offline" style="display: none;">
    <div class="weui-cells login">
      <div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label">充值金额</label></div>
        <div class="weui-cell__bd"><input type="number" id="amount"
            placeholder="请填写充值金额" class="weui-input"></div>
      </div>
      <div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label">账单流水号</label></div>
        <div class="weui-cell__bd"><input type="text" id="number"
            placeholder="请填写账单流水号" class="weui-input"></div>
      </div>
      <div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label">充值方式</label></div>
        <div class="weui-cell__bd"><input type="text" id="type"
            placeholder="网银转账、柜台汇款、汇款人等" class="weui-input"></div>
      </div>


      <div class="weui-btn-area">
        <a class="weui-btn weui-btn_primary" id="submitBtn">
          确认充值
        </a>
      </div>

    </div>
    <div class="tips">
      <h2>温馨提示：</h2>
      <ol>
        <li>1. 请仔细确认充值金额与账单流水号！</li>
        <li>2. 请您根据自身真实情况填写，98配资网会对用户的所有资料进行严格保密。</li>
        <li>3. 使用过程中遇到问题，请及时联系客服。郭经理：电话/微信：18311187611
          QQ：761369662 刘经理：电话/微信：18612226789 QQ ：215772907</li>
      </ol>
    </div>
  </div>

  <script src="./js/libs/require.min.js">































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































  </script>
  <script>
    require(['js/recharge.js'])
  </script>


</body>
</html>
