<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="header.jsp"%>
<%
	String type = (String)request.getParameter("type");
	Integer typeInt = 0;
	if (type.equals("free")){
		typeInt = 1;
	} else if(type.equals("day")){
		typeInt = 2;
	} else if(type.equals("month")){
		typeInt = 3;
	}
	String baozhengAmount = (String)request.getParameter("margin");
	String dayCount = (String)request.getParameter("deadline");
	String tradeCount = (String)request.getParameter("multiple");
	String tradeDay = (String)request.getParameter("startDate");
	String caopanAmount = (String)request.getParameter("caopanAmount");
	String pingcangLine = (String)request.getParameter("pingcangLine");
	String warnLine = (String)request.getParameter("warnLine");

%>
<script type="text/javascript">

$(document).ready(function() {	
	$("#submitBtn").click(function(){
		var account = <%=account%>;
		var type = <%=typeInt%>;
		var baozhengAmount = <%=baozhengAmount%>;
		var dayCount = <%=dayCount%>;
		var rate = document.getElementById("interest").innerHTML;
		var tradeCount = <%=tradeCount%>;
		var peiziAmount = baozhengAmount*tradeCount;
		var caopanAmount = <%=caopanAmount%>;;
		var warnLine = <%=warnLine%>;;
		var pingcangLine = <%=pingcangLine%>;;
		var tradeDay = <%=tradeDay%>;
		if(null == <%=account%>){
			alert("请先登录再进行配资操作！");
			window.location.href="./login.jsp";
		}
		
		peiziSubmit(account,type,baozhengAmount,dayCount,rate,peiziAmount,caopanAmount,warnLine,pingcangLine,tradeDay,tradeCount);
	
	});

});

function peiziSubmit(account,type,baozhengAmount,dayCount,rate,peiziAmount,caopanAmount,warnLine,pingcangLine,tradeDay,tradeCount){
	var RESTFUL_BASE = serviceurl.baseurl;
     $.ajax({
	         url: RESTFUL_BASE  + "/web/peizi/submit",
	         type: 'POST',
	         data: {"account":account,"type":type,"baozhengAmount":baozhengAmount,"dayCount":dayCount,
	         "rate":rate,"peiziAmount":peiziAmount,"caopanAmount":caopanAmount,"warnLine":warnLine,"pingcangLine":pingcangLine,
	         "tradeDay":tradeDay,"tradeCount":tradeCount},
	         dataType: 'json',
	         success: function(data){
	             if(data.resultCode == 1) {
            	 	alert(data.resultMessage);
	             } else {
	            	 alert("配置申请提交成功");
	            	 $.ajax({
	            	        url: RESTFUL_BASE+"/web/user/getamount/"+account,
	            	        type: 'GET',
	            	        dataType: 'json',
	            	        success: function(data){
	            	        	//http://lcppay.com/a/payment/sandpay/gopay?account=5771001&rmb=5015.00&dollar=5000.00&bankCode=01050000&rage=2.00
         	        			var jiaoYiAccount=data.account;
	            	        	var dollar = baozhengAmount.toFixed(2);
	            	        	var rmb = (baozhengAmount + (baozhengAmount*0.003)).toFixed(2);
	            	        	var jiaoYiRate = parseFloat(rate).toFixed(2);
	            	        	var redirectUrl= "http://lcppay.com/a/payment/sandpay/gopay?account="+ jiaoYiAccount+"&rmb="+ rmb +"&dollar="+ dollar+ "&bankCode="+ $("#bankCode").val() +"&rate=" + jiaoYiRate;
	            	           	window.open(redirectUrl);
	            	        }
	            	 });
				}
			}
		});
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
        确认支付
      </h1>
    </div>
  </div>

  <div class="weui-cells">
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
    require(['js/stock-enter.js'])
  </script>

</body>
</html>
