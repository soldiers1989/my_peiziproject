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
	            	 window.location.href = "./index.jsp";
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
