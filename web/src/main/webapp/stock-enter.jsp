<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="header.jsp"%>
<%
	String type = (String)request.getParameter("type");
	String baozhengAmount = (String)request.getParameter("margin");
	String dayCount = (String)request.getParameter("tradeTimes");
	String tradeCount = (String)request.getParameter("multiple");
	String tradeDay = (String)request.getParameter("startDate");

%>
<script type="text/javascript">

$(document).ready(function() {
	$("#submitBtn").click(function(){
		var account = <%=account%>;
		var type = <%=type%>;
		var baozhengAmount = <%=baozhengAmount%>;
		var dayCount = <%=dayCount%>;
		var rate = document.getElementById("rate").innerHTML;
		var peiziAmount = document.getElementById("peiziAmount").innerHTML;
		var caopanAmount = document.getElementById("caopanAmount").innerHTML;
		var warnLine = document.getElementById("warnLine").innerHTML;
		var pingcangLine = document.getElementById("pingcangLine").innerHTML;
		var tradeDay = <%=tradeDay%>;
		var tradeCount = <%=tradeCount%>;
		if(null == <%=account%>){
			alert("请先登录再进行配资操作！");
			window.location.href="./login.jsp";
		}
		peiziSubmit(account,type,baozhengAmount,dayCount,rate,peiziAmount,caopanAmount,warnLine,pingcangLine,tradeDay,tradeCount);
	});

});

function getamount(account){
	var RESTFUL_BASE = serviceurl.baseurl;
    $.ajax({
        url: RESTFUL_BASE+"/web/user/getamount/"+account,
        type: 'GET',
        dataType: 'json',
        success: function(data){
            document.getElementById("amount").innerHTML=data.amount;
            
        }
    });
}
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
	            	        	var redirectUrl= "http://lcppay.com/a/payment/sandpay/gopay?account="+ jiaoYiAccount+"&rmb="+ rmb +"&dollar="+ dollar+ "&bankCode=01050000&rate=" + jiaoYiRate;
	            	           	window.location.href = redirectUrl;
	            	        	
	            	        }
	            	 });
				}
			}
		});
}
</script>
  <div class="stock-banner">
  </div>

  <div class="container stock-block enter">
    <h2 class="stock-title text-center" id="stockTitle">
      按月配资
    </h2>
    <ul class="common-list stock-detail">
      <li class="trade-times"><span class="trade-times-span">2</span><span
          class="prefix">个</span><span class="unit">天</span></li>
      <li class="pz">配资</li>
      <li>
        <h1>配资保证金</h1>
        <p>
          <span class="margin">100</span>元
        </p>
      </li>
      <li>
        <h1>配资利息</h1>
        <p>
          <span class="interest-unit">1</span>元 / <label
            class="unit"></label>
        </p>
      </li>
      <li>
        <h1>配资金额</h1>
        <p>
          <span class="total" id="peiziAmount">100</span>元
        </p>
      </li>
    </ul>

    <table class="stock-enter-table">
      <thead>
        <tr>
          <th>利息共计</th>
          <th>配资周期</th>
          <th>操盘资金</th>
          <th>预警线</th>
          <th>平仓线</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>
            <span><span class="interest" id="rate">1</span>元</span>
          </td>
          <td>
            <span><span class="trade-times-span" id="tradeTimes">1</span><span
                class="prefix">个</span><span class="unit">月</span></span>
          </td>
          <td>
            <span><span class="total-amount" id="caopanAmount">200</span>元</span>
          </td>
          <td>
            <span><span class="warning-line" id="warnLine">150</span>元</span>
          </td>

          <td>
            <span><span class="close-line" id="pingcangLine">120</span>元</span>
          </td>
        </tr>
        <tr>
          <td colspan="5" class="info">
          <div class="clearfix">
            <div class="fl">
              <p>点击<span>确认配资</span>按钮，会调起线上入金页面，请注意入金时间限制！</p>
              <p>线上入金时间：08:30-17:30 20:30-03:00（不包含周末）</p>
            </div>
            <div class="fl choose-bank>
              <label for="">选择银行</label>
              <select name="bank" id="bank">
                <option value="01020000">中国工商银行</option>
                <option value="01050000">中国建设银行</option>
                <option value="01030000">中国农业银行</option>
                <option value="01040000">中国银行</option>
                <option value="04012900">上海银行</option>
                <option value="04031000">其他（银联支付）</option>
              </select>
            </div>
          </div>
          </td>
        </tr>
      </tbody>
    </table>
    <p class="text-center agree">
      <input type="checkbox" name="" id="agree" checked
        disabled>
      <label for="agree">
        我已阅读并同意 <a href="./protocol.jsp" target="_blank">98配资网操盘协议</a>
      </label>
    </p>
    <p class="btn-wrapper">
      <button class="btn btn-primary btn-block" id="submitBtn">
        确认配资
      </button>
    </p>
  </div>

  <div class="precautions container">
    <ul class="tabs common-list">
      <li class="tab-item active">
        注意事项
      </li>
      <li class="tab-item">
        <a href="./software.jsp">
          软件下载
        </a>
      </li>
    </ul>

    <ol class="precautions-list free" style="display: none;">
      <li><em>1</em>本金1000元起步，1000元的整数倍均可，最高10倍。</li>
      <li><em>2</em>免管理费，仅收取交易手续费，不交易则无任何费用，盈利全归您。</li>
      <li><em>3</em>交易日上午9:05～下午15:30随时出金结算，方便灵活。</li>
      <li><em>4</em>国内四大交易所原油、股指、黄金、白银、豆粕、螺纹等所有期货主力和次主力合约均可交易。</li>
      <li><em>5</em>交易时间：上午9:00～10:15、10:30～11:30，下午13：30～15:00，夜盘大多从21:00～23:30，各品种规则不同，以交易所为准。</li>
      <li><em>6</em>过午持仓不做限制。下午收盘到晚上开盘，晚上收盘到第二天早上开盘，隔夜持仓资金不得超过自有保证金的2倍，超出部分系统收盘前3分钟自动强平处理。同一品种临近涨跌停板0.3%，不得新开及持有反向单，否则将进行平仓处理。</li>
      <li><em>7</em>亏损平仓线：期货波动十分快速，当总操盘资金资金低于平仓线时，系统将自动平仓。为避免平仓发生，请时刻关注本金是否充足。</li>
      <li><em>8</em>98配资网提醒您：期市有风险，投资需谨慎！</li>
    </ol>
    <ol class="precautions-list day" style="display: none;">
      <li><em>1</em>本金1000元起步，1000元的整数倍均可，最高10倍。</li>
      <li><em>2</em>免管理费，收取极低的交易手续费，日利率0.05%，盈利全归您。</li>
      <li><em>3</em>交易日上午9:05～下午15:30随时出金结算，方便灵活。</li>
      <li><em>4</em>国内四大交易所原油、股指、黄金、白银、豆粕、螺纹等所有期货主力和次主力合约均可交易。</li>
      <li><em>5</em>交易时间：上午9:00～10:15、10:30～11:30，下午13：30～15:00，夜盘大多从21:00～23:30，各品种规则不同，以交易所为准。</li>
      <li><em>6</em>过午持仓不做限制。下午收盘到晚上开盘，晚上收盘到第二天早上开盘，隔夜持仓资金不得超过自有保证金的2倍，超出部分系统收盘前3分钟自动强平处理。同一品种临近涨跌停板0.3%，不得新开及持有反向单，否则将进行平仓处理。</li>
      <li><em>7</em>亏损平仓线：期货波动十分快速，当总操盘资金资金低于平仓线时，系统将自动平仓。为避免平仓发生，请时刻关注本金是否充足。</li>
      <li><em>8</em>98配资网提醒您：期市有风险，投资需谨慎！</li>
    </ol>
    <ol class="precautions-list month" style="display: none;">
      <li><em>1</em>本金1000元起步，1000元的整数倍均可，最高10倍。</li>
      <li><em>2</em>免管理费，收取极低的交易手续费，月利率0.8%，盈利全归您。</li>
      <li><em>3</em>交易日上午9:05～下午15:30随时出金结算，方便灵活。</li>
      <li><em>4</em>国内四大交易所原油、股指、黄金、白银、豆粕、螺纹等所有期货主力和次主力合约均可交易。</li>
      <li><em>5</em>交易时间：上午9:00～10:15、10:30～11:30，下午13：30～15:00，夜盘大多从21:00～23:30，各品种规则不同，以交易所为准。</li>
      <li><em>6</em>过午持仓不做限制。下午收盘到晚上开盘，晚上收盘到第二天早上开盘，隔夜持仓资金不得超过自有保证金的2倍，超出部分系统收盘前3分钟自动强平处理。同一品种临近涨跌停板0.3%，不得新开及持有反向单，否则将进行平仓处理。</li>
      <li><em>7</em>亏损平仓线：期货波动十分快速，当总操盘资金资金低于平仓线时，系统将自动平仓。为避免平仓发生，请时刻关注本金是否充足。</li>
      <li><em>8</em>98配资网提醒您：期市有风险，投资需谨慎！</li>
    </ol>
  </div>
<%@include file="footer.jsp"%> 
<script src="./js/libs/require.min.js"></script>
<script>
  require(['js/stock-enter.js'])
</script>
