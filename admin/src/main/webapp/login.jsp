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
  <link rel="stylesheet" href="./css/font-awesome.min.css">
  <link rel="stylesheet" href="./css/libs/swiper-4.3.5.min.css">
  <link rel="stylesheet" href="./css/libs/layer.css">
  <link rel="stylesheet" href="./css/main.css">
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
	<script src="<%=basePath%>/js/login.js"></script>
	<script type="text/javascript">

$(document).ready(function() {
	createCode(4);
});

//生成验证码的方法
function createCode(length) {
    var code = "";
    var codeLength = parseInt(length); //验证码的长度
    var checkCode = document.getElementById("checkCode");
    ////所有候选组成验证码的字符，当然也可以用中文的
    var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
    'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); 
    //循环组成验证码的字符串
    for (var i = 0; i < codeLength; i++)
    {
        //获取随机验证码下标
        var charNum = Math.floor(Math.random() * 62);
        //组合成指定字符验证码
        code += codeChars[charNum];
    }
    if (checkCode)
    {
        //为验证码区域添加样式名
        checkCode.className = "code";
        //将生成验证码赋值到显示区
        checkCode.innerHTML = code;
    }
}
</script>
  <title>登录</title>
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
  <div class="login-banner">
    <div class="container">
      <h1>专注期货配资十年</h1>
      <h1>您身边的配资专家</h1>
      <form action="#" class="login-form" id="loginForm">
        <p class="error-tips" id="errorTips">
          <i class="fa fa-times-circle"></i> <span>错误信息</span>
        </p>
        <p class="form-item">
          <img src="./images/login/user.png" alt="" class="form-icon">
          <input type="number" placeholder="请输入注册手机号码" id="mobile">
        </p>
        <p class="form-item">
          <img src="./images/login/password.png" alt=""
            class="form-icon">
          <input type="password" placeholder="请输入密码" id="password">
        </p>
        <p class="form-item">
          <input type="text" placeholder="验证码" class="verif-code-input" id="code" name="code" />
          <span id="checkCode" name="checkCode" onclick="createCode(4)"></span>&nbsp;&nbsp;&nbsp;
          <a href="#" onclick="createCode(4)">刷新</a>
        </p>
        <p class="form-item">
          <button class="btn btn-orange btn-block">登录</button>
        </p>
        <p class="text-center">
          还没有账号？
          <a href="./register.html" class="register-link">免费注册</a>
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
    require(['js/login.js'])
  </script>
</body>
</html>
