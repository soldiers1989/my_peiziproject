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
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="<%=basePath%>/css/font-awesome.min.css">
  <link rel="stylesheet" href="<%=basePath%>/css/libs/swiper-4.3.5.min.css">
  <link rel="stylesheet" href="<%=basePath%>/css/libs/layer.css">
  <link rel="stylesheet" href="<%=basePath%>/css/main.css">
  <script src="<%=basePath%>/resources/plugins/jQuery/jQuery-2.1.3.min.js"></script>
  <script src="<%=basePath%>/resources/util/tools.js" type="text/javascript"></script>
  <title>首页</title>
</head>
<body class="has-all">
  <div class="fixed-right">
    <div class="weixin">
      <i class="fa fa-weixin"></i>
      <p>微信客服</p>
      <div class="clearfix">
        <img src="./images/index/weixin.jpg" alt="" class="fl">
        <img src="./images/index/weixin1.jpg" alt="" class="fl">
      </div>
    </div>
  </div>
  <div class="top-bar">

<div class="container clearfix">
      <div class="top-bar-left fl">
        <i class="fa fa-phone"></i>
        客服电话: <span>400-888-8888</span>
        &nbsp;
        <i class="fa fa-globe"></i>
        易记网址： <span>www.95888.com</span>
      </div>
      <div class="top-bar-right fr">
      <%if (null == account) {%>
        <a class="login-link" href="./login.jsp">立即登录</a>
        <span>|</span>
        <a class="register-link" href="./register.jsp">免费注册</a>
        <%} else { %>
                          欢迎您：<%=account %> &nbsp;&nbsp;<a class="login-link" href="./account.jsp">我的帐户</a>
                          <span>|</span>
        <a class="register-link" href="./logoutServlet">退出</a>
        <%} %>
      </div>
    </div>
  </div>
   <div class="header">
    <div class="container clearfix">
      <a href="./index.jsp" class="logo fl">
        <img src="./images/index/logo.png" alt="">
      </a>
      <ul class="nav fr">
        <li>
          <a href="./index.jsp">网站首页</a>
        </li>
        <li>
          <a href="./stock-free.jsp">免息配资</a>
        </li>
        <li>
          <a href="./stock-day.jsp">按天配资</a>
        </li>
        <li>
          <a href="./stock-month.jsp">按月配资</a>
        </li>
        <li>
          <a href="./software.jsp">交易软件</a>
        </li>
        <li>
          <a href="./share.jsp">我要推广</a>
        </li>
      </ul>
    </div>
  </div>
