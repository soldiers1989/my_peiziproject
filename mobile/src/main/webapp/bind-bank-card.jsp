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
        绑定银行卡
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
          开户行
        </label></div>
      <div class="weui-cell__bd">
        <input type="text" name="bank" placeholder="请输入开户行"
          class="weui-input" id="bank">
      </div>
    </div>
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label">
          银行卡号
        </label></div>
      <div class="weui-cell__bd">
        <input type="text" name="number" placeholder="请输入银行卡号"
          class="weui-input" id="number">
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
    require(['js/bind-bank.js'])
  </script>

</body>
</html>
