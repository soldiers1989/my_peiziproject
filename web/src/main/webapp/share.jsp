<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="header.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	if(null == <%=account%>){
		$("#input").val("http://47.95.214.33/register.jsp");
	} else {
		$("#input").val("http://47.95.214.33/register.jsp?remdPhone=" + <%=account%>);
	}
	
});
</script>
  <div class="share-bg">
  </div>
  <div class="share-code">
    <label for="">您的推广链接</label>
    <input type="text" value="" id="input" readonly>
    <button id="copyBtn" class="btn" data-clipboard-target="#input">复制</button>
  </div>
<%@include file="footer.jsp"%> 
<script src="./js/libs/require.min.js"></script>
<script>
  require(['js/share.js'])
</script>