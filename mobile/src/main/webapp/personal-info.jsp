<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="header.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	if(null == <%=account%>){
		window.location.href="./login.jsp";
	}
	getamount(<%=account%>);
});


function getamount(account){
	var RESTFUL_BASE = serviceurl.baseurl;
    $.ajax({
        url: RESTFUL_BASE+"/web/user/getamount/"+account,
        type: 'GET',
        dataType: 'json',
        success: function(data){
            //document.getElementById("amount").innerHTML=data.amount;
            if (data.centStatus == 0){
            	document.getElementById("centDiv").innerHTML="未认证";
            } else if (data.centStatus == 1){
            	document.getElementById("centDiv").innerHTML="已认证";
            	
            }
            
            if (data.bankStatus == 0){
            	document.getElementById("bankDiv").innerHTML="未绑定";
            } else if (data.bankStatus == 1){
            	document.getElementById("bankDiv").innerHTML="已绑定";
            }
        }
    });
}
function validateCent(){
	var centInfo = document.getElementById("centDiv").innerHTML;
	if (centInfo == '未认证'){
		window.location.href="./verified.jsp";
	} else {
		alert("用户身份信息已认证！");
	}
}
function validateBank(){
	var centInfo = document.getElementById("bankDiv").innerHTML;
	if (centInfo == '未绑定'){
		window.location.href="./bind-bank-card.jsp";
	} else {
		alert("用户银行卡信息已绑定！");
	}
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
        个人资料
      </h1>
    </div>
  </div>

  <div class="personal-info">
    <div class="weui-cells">
      <div class="weui-cell">
        <div class="weui-cell__bd">
          <p>手机号码</p>
        </div>
        <div class="weui-cell__ft"><%=account %></div>
      </div>
      <a href="#" class="weui-cell weui-cell_access" onclick="validateCent();">
        <div class="weui-cell__bd">
          <p>实名认证</p>
        </div>
        <div class="weui-cell__ft" id="centDiv">未认证</div>
      </a>
      <a href="#" class="weui-cell weui-cell_access" onclick="validateBank();">
        <div class="weui-cell__bd">
          <p>银行卡号</p>
        </div>
        <div class="weui-cell__ft" id="bankDiv">未绑定</div>
      </a>
    </div>
  </div>

</body>
</html>
