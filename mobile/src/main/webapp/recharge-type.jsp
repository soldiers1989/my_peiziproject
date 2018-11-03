<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="header.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	if(null == <%=account%>){
		window.location.href="./login.jsp";
	}
	setaccount(<%=account%>);
});


function setaccount(account){
	$("#account").val(account);
}

</script>
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


  <div class="recharge-content offline" style="display: block;">
    <div class="weui-cells login">
    
    <input type="hidden" id="account" name="account" value=""/>
      
      <div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label">充值金额</label></div>
        <div class="weui-cell__bd"><input type="number" id="amount"
            placeholder="请填写充值金额" class="weui-input"></div>
      </div>
      <div class="weui-cell weui-cell_select weui-cell_select-after">
        <div class="weui-cell__hd">
          <label for="" class="weui-label">选择银行</label>
        </div>
        <div class="weui-cell__bd">
          <select class="weui-select" id="bankCode" name="bankCode">
            <option value="01020000">中国工商银行</option>
            <option value="01050000">中国建设银行</option>
            <option value="01030000">中国农业银行</option>
            <option value="01040000">中国银行</option>
            <option value="04012900">上海银行</option>
            <option value="04031000">北京银行</option>
          </select>
        </div>
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
        <li>1. 线上入金时间：08:30-17:30 20:30-03:00（周六日及法定节假日除外）。</li>
        <li>2. 线上入金时，第三方支付机构收取0.3%的手续费。</li>
        <li>3. 如入金金额较大，可联系客服线下入金（线下入金无任何手续费，且不影响线上出金功能的正常使用）。</li>
        <li>4. 刘经理：电话/微信：18612226789 QQ：215772907	郭经理：电话/微信：18311187611 QQ：761369662 </li>
      </ol>
    </div>
  </div>

  <script src="./js/libs/require.min.js" ></script>
  <script>
    require(['js/recharge.js'])
  </script>


</body>
</html>
