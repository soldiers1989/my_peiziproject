<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  request.getSession().invalidate();

String basePath = request.getContextPath();
String curPage = request.getRequestURI();
String queryStr = request.getQueryString();
// 如果有请求参数，则加上请求参数
if (null != queryStr && queryStr.length() > 0) {
    queryStr = curPage + "?" + queryStr;
} else {
    queryStr =  curPage;
} 

%>
<script language="javascript">
 window.location="<%=basePath%>/logoutservlet";
</script>