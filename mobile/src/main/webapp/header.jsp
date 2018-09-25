<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String basePath = request.getContextPath();
	String curPage = request.getRequestURI();
	String queryStr = request.getQueryString();
	// 如果有请求参数，则加上请求参数
	if (null != queryStr && queryStr.length() > 0) {
	    queryStr = curPage + "?" + queryStr;
	} else {
	    queryStr =  curPage;
	}  
	String account = (String)session.getAttribute("account");

%>

<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"
    name="viewport" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="./css/libs/weui.min.css">
  <link rel="stylesheet" href="./css/libs/jquery-weui.min.css">
  <link rel="stylesheet" href="./css/main.css">
  <script src="<%=basePath%>/resources/plugins/jQuery/jQuery-2.1.3.min.js"></script>
  <script src="<%=basePath%>/resources/util/tools.js" type="text/javascript"></script>
  <title>首页</title>
</head>
<body class="has-all">
  <!-- 顶部导航栏 -->
  <div class="header">
    <div class="hd-center">
      <h1 class="title">
        header页面
      </h1>
    </div>
  </div>
