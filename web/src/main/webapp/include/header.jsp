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
        <a class="login-link" href="./login.html">立即登录</a>
        <span>|</span>
        <a class="register-link" href="./register.html">免费注册</a>
      </div>
    </div>
  </div>