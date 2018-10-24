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
        	if (null == data.account){
        		document.getElementById("account").innerHTML= "提交配资申请，自动分配帐号!";
        	} else {
        		document.getElementById("account").innerHTML=data.account;
        	}
            
            if (data.centStatus == 0){
            	document.getElementById('centP1').style.display = 'block';
            } else if (data.centStatus == 1){
            	document.getElementById('centP2').style.display = 'block';
            	document.getElementById("realName").innerHTML=data.realName;
            }
            
            if (data.bankStatus == 0){
            	document.getElementById('bankP1').style.display = 'block';
            } else if (data.bankStatus == 1){
            	document.getElementById('bankP2').style.display = 'block';
            	document.getElementById("bankName").innerHTML=data.bankName;
            }
        }
    });
}

</script>
  <div class="account container clearfix">
    <div class="account-side fl">
      <h1 class="title">我的账户</h1>
      <ul class="side-menu">
        <li>
          <a href="#">
            <i class="fa fa-address-card"></i>
            我的账号
          </a>
          <ul class="sub-menu">
            <li class="active">
              <a href="./account.jsp">个人主页</a>
            </li>
          </ul>
        </li>
        <li>
          <a href="#"><i class="fa fa-credit-card"></i>
            我的资金</a>
          <ul class="sub-menu">
            <li>
              <a href="./recharge.jsp">入金</a>
            </li>
            <li>
              <a href="./withdraw.jsp">出金</a>
            </li>
          </ul>
        </li>
        <li>
          <a href="#"> <i class="fa fa-gear"></i> 系统操作</a>
          <ul class="sub-menu">
            <li>
              <a href="./change-password.jsp">修改密码</a>
            </li>
            <li>
              <a href="./logoutServlet">退出登录</a>
            </li>
          </ul>
        </li>
      </ul>
    </div>
    <div class="account-main fr">
      <h1 class="account-title">我的主页</h1>
      <div class="profile clearfix">
        <div class="avatar fl">
          <img src="./images/account/avator.jpg" alt="">
        </div>
        <div class="info fr">
          <p>交易帐号</p>
          <h1><span id="account">无</span></h1>
          <p>
            <a href="./withdraw.jsp" class="btn btn-primary">出金</a>
            <a href="./recharge.jsp" class="btn btn-primary">入金</a>
          </p>
        </div>
      </div>

      <div class="account-info">
        <p>
          <span class="label">手机号码</span>
          <span><%=account %></span>
          <span>
          <i class="icon icon-checked"></i>
            	已认证
          </span>
        </p>
        <p id="centP1" style="display:none">
          <span class="label">真实姓名</span>
          <span></span>
          <span>
            <i class="icon icon-unchecked"></i>
            <a href="./authentication.jsp">认证</a>
          </span>
        </p>
        <p id="centP2" style="display:none">
          <span class="label">真实姓名</span>
          <span id="realName">已认证</span>
          <span>
            <i class="icon icon-checked"></i>
                                            已认证
          </span>
        </p>
        <p  id="bankP1" style="display:none">
          <span class="label">银行卡</span>
          <span></span>
          <span>
            <i class="icon icon-unchecked"></i>
            <a href="./bank-card.jsp">绑定</a>
          </span>
        </p>
        <p  id="bankP2" style="display:none">
          <span class="label">银行卡</span>
          <span id="bankName">未绑定</span>
          <span>
            <i class="icon icon-checked"></i>
            	已绑定
          </span>
        </p>
      </div>
    </div>
  </div>
 <%@include file="footer.jsp"%> 
<script src="<%=basePath%>/js/libs/require.min.js"></script>
<script>
 require(['js/account.js'])
</script>