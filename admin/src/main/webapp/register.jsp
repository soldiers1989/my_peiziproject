<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
  	String basePath = request.getContextPath();
	String curPage = request.getRequestURI();
	String queryStr = request.getQueryString();
	// 如果有请求参数，则加上请求参数
	if (null != queryStr && queryStr.length() > 0) {
		queryStr = curPage + "?" + queryStr;
	} else {
		queryStr = curPage;
	}
%>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="<%=basePath%>/css/font-awesome.min.css">
  <link rel="stylesheet" href="<%=basePath%>/css/libs/swiper-4.3.5.min.css">
  <link rel="stylesheet" href="<%=basePath%>/css/libs/layer.css">
  <link rel="stylesheet" href="<%=basePath%>/css/main.css">
	<!-- jQuery 2.1.3 -->
	<script src="<%=basePath%>/resources/plugins/jQuery/jQuery-2.1.3.min.js"></script>
	<!-- Bootstrap 3.3.2 JS -->
	<script src="<%=basePath%>/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<!-- iCheck -->
	<script src="<%=basePath%>/resources/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
	<!-- form 表单验证 -->
	<script src='<%=basePath%>/resources/plugins/jQuery/jquery.validate.js'></script>
	<script src='<%=basePath%>/resources/plugins/jQuery/messages_zh.js'></script>
	<!-- method tools -->
	<script src="<%=basePath%>/resources/util/tools.js" type="text/javascript"></script>
	<!-- 自定义congfirm、alert -->
	<script src="<%=basePath%>/resources/msgBox/MsgBox.js"></script>
	<script src="<%=basePath%>/js/register.js"></script>
  <title>注册</title>
</head>
<body class="has-all">
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
  <div class="header">
    <div class="container clearfix">
      <a href="./index.html" class="logo fl">
        <img src="./images/index/logo.png" alt="">
      </a>
      <ul class="nav fr">
        <li>
          <a href="./index.html">网站首页</a>
        </li>
        <li>
          <a href="./stock-free.html">免息配资</a>
        </li>
        <li>
          <a href="./stock-day.html">按天配资</a>
        </li>
        <li>
          <a href="./stock-month.html">按月配资</a>
        </li>
        <li>
          <a href="./software.html">交易软件</a>
        </li>
        <li>
          <a href="./share.html">我要推广</a>
        </li>
      </ul>
    </div>
  </div>
  <div class="register">
    <div class="container">
      <form action="#" class="register-form">
        <p class="form-item">
          <label for="">手机号码</label>
          <input type="text" name="mobile" placeholder="请输入您的手机号码"
            id="mobile">
        </p>
        <p class="form-item code">
          <label for="">短信验证码</label>
          <input type="text" name="code" placeholder="请输入短信验证码"
            id="code">
          <button class="btn get-code btn-green" type="button"
            id="getCodeBtn">获取验证码</button>
        </p>
        <p class="form-item">
          <label for="">密码</label>
          <input type="password" name="password"
            placeholder="请输入密码" id="password">
        </p>
        <p class="form-item">
          <label for="">确认密码</label>
          <input type="password" id="confirmPassword"
            placeholder="请确认密码">
        </p>

        <p class="agree form-item">
          <input type="checkbox" id="" checked disabled>
          <span>
            同意 <a href="#">注册服务协议</a>
          </span>
        </p>
        <p class="btn-wrapper">
          <button class="btn btn-block btn-primary" type="button"
            id="submitBtn">
            同意协议并注册
          </button>
        </p>
        <p class="form-item btn-wrapper text-center color-orange">
          已有账号 <a href="./login.html" class="text-orange">立即登录
          </a>
        </p>
      </form>
    </div>
  </div>
  <div class="footer ">
    <div class="container">
      <div class="contact clearfix">
        <div class="service fl">
          <h1>客服热线</h1>
          <h1>400-888-8888</h1>
          <a href="#"><i class="fa fa-qq"></i>QQ客服</a>
        </div>
        <div class="app-qrcode fl clearfix">
          <div class="fl">
            <img src="./images/software/android.jpg" alt="">
            <p>扫一扫关注我们</p>
          </div>
          <div class="fl">
            <img src="./images/software/ios.jpg" alt="">
            <p>苹果版APP下载</p>
          </div>
          <div class="fl">
            <img src="./images/software/ios.jpg" alt="">
            <p>苹果版APP下载</p>
          </div>
        </div>
        <div class="links fr">
          <a href="./stock-free.html">免息配资</a>
          <a href="./stock-day.html">按天配资</a>
          <a href="./stock-month.html">按月配资</a>
        </div>
      </div>
      <p class="copyright">
        Copyright @ 2014~2017 All Rights Reserved.
        （市场有风险，投资需谨慎） 京ICP备17140308号-1
      </p>
    </div>
  </div>

  <script src="./js/libs/require.min.js"></script>
  <script>
    require(['js/register.js'])
  </script>
</body>
</html>
