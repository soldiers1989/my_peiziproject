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
	String account = (String)session.getAttribute("account");
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
	<script src="<%=basePath%>/js/index.js"></script>
  <title>首页</title>
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
      <%if (null == account) {%>
        <a class="login-link" href="./login.html">立即登录</a>
        <span>|</span>
        <a class="register-link" href="./register.html">免费注册</a>
        <%} else { %>
        	欢迎您：<%=account %> &nbsp;&nbsp;<a class="login-link" href="./account.html">我的帐户</a>
        <%} %>
      </div>
    </div>
  </div>
  <div class="header">
    <div class="container clearfix">
      <a href="./index.html" class="logo fl">
        <img src="./images/index/logo.png" alt="">
      </a>
      <ul class="nav fr">
        <li class="active">
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
  <div class="swiper-container banner">
    <div class="container">
      <div class="banner-box fr">
        <div class="slogan">
          <p>你操盘，我出钱</p>
          <h1>目前免息操盘30天</h1>
          <h3>奖金100%双重保障/实盘交易</h3>
        </div>
        <p>
          <a href="./register.html" class="btn btn-block btn-primary">免费注册</a>
        </p>
        <p>
          有账号？ <a href="./login.html">立即登录</a>
        </p>
      </div>
    </div>
    <div class="swiper-wrapper">
      <a class="swiper-slide" style="background:url('./images/index/banner1.png') no-repeat center center">
      </a>
      <a class="swiper-slide" style="background:url('./images/index/banner2.png') no-repeat center center">
      </a>
      <a class="swiper-slide" style="background:url('./images/index/banner3.png') no-repeat center center">
      </a>
      <a class="swiper-slide" style="background:url('./images/index/banner4.png') no-repeat center center">
      </a>
      <!-- <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div> -->
    </div>
    <div class="swiper-pagination"></div>
  </div>
  <div class="block">
    <div class="container">
      <div class="preview clearfix">
        <ul class="common-list data-preview fl">
          <li>
            <p>累计配资人数</p>
            <h1><strong id="countUp1" data-num="339709"></strong>
              <span>人</span></h1>
          </li>
          <li>
            <p>累计配资金额</p>
            <h1><strong id="countUp2" data-num="9891513190"></strong>
              <span>元</span></h1>
          </li>
          <li>
            <p>用户累计盈利</p>
            <h1><strong id="countUp3" data-num="898999990"></strong>
              <span>元</span></h1>
          </li>
          <li>
            <p>平台安全运营</p>
            <h1><strong id="countUp4" data-num="1298"></strong>
              <span>天</span></h1>
          </li>
        </ul>
      </div>
    </div>
  </div>
  <div class="block">
    <div class="container">
      <ul class="common-list introduction">
        <li>
          <img src="./images/index/i-1.png" alt="">
          <h1>灵活边界</h1>
          <p>闪电提现，十分钟到账</p>
        </li>
        <li>
          <img src="./images/index/i-2.png" alt="">
          <h1>超低费用</h1>
          <p>最低100元起配资，最高十倍杠杆</p>
        </li>
        <li>
          <img src="./images/index/i-3.png" alt="">
          <h1>真实安全</h1>
          <p>成交数据资金第三方监管</p>
        </li>
        <li>
          <img src="./images/index/i-4.png" alt="">
          <h1>交易保障</h1>
          <p>采用大智慧专业股票交易</p>
        </li>
        <li>
          <img src="./images/index/i-5.png" alt="">
          <h1>专业服务</h1>
          <p>专业团队执业经验，有问必答</p>
        </li>
      </ul>
    </div>
  </div>

  <div class="container">
    <ul class="common-list capital">
      <li>
        <h1 class="title">免息配资</h1>
        <div class="item first">
          <div class="line">
            <h1>1000元起申请</h1>
          </div>
          <div class="line">
          </div>
        </div>
        <div class="item">
          <div class="line">
            <p>小投入</p>
            <p>盈利七成归您</p>
          </div>
          <div class="line">
            <p>大回报</p>
            <p>所有品种均可交易</p>
          </div>
        </div>
        <p class="before-btn">资金三方托管/保险双保障 全实盘交易</p>
        <p class="btn-wrapper">
          <a href="./stock-free.html" class="btn outline primary btn-block">立即申请</a>
        </p>
      </li>
      <li>
        <h1 class="title title-p">按天配资</h1>
        <div class="item first">
          <div class="line">
            <h1>1000元起申请</h1>
          </div>
          <div class="line">
          </div>
        </div>
        <div class="item">
          <div class="line">
            <p>低门槛</p>
            <p>用几天算几天</p>
          </div>
          <div class="line">
            <p>低风险</p>
            <p>最高可申请500万</p>
          </div>
        </div>
        <p class="before-btn">资金三方托管/保险双保障 全实盘交易</p>
        <p class="btn-wrapper">
          <a href="./stock-day.html" class="btn outline orange btn-block">立即申请</a>
        </p>
      </li>
      <li>
        <h1 class="title title-b">按月配资</h1>
        <div class="item first">
          <div class="line">
            <h1>申请1-12个月</h1>
          </div>
          <div class="line">
          </div>
        </div>
        <div class="item">
          <div class="line">
            <p>低门槛</p>
            <p>利息低至万分八</p>
          </div>
          <div class="line">
            <p>低风险</p>
            <p>最高申请1000万</p>
          </div>
        </div>
        <p class="before-btn">资金三方托管/保险双保障 全实盘交易</p>
        <p class="btn-wrapper">
          <a href="./stock-month.html" class="btn outline orange btn-block">立即申请</a>
        </p>
      </li>
    </ul>
  </div>

  <div class="container">
    <ul class="common-list misc">
      <li>
        <h1>交易软件下载</h1>
        <p class="info">新用户注册并实名认证后 <br> 请下载安装此交易软件
          <br>&nbsp;</p>
        <img src="./images/index/software.png" alt="">
        <p class="btn-wrapper">
          <a href="./software.html" class="btn btn-orange outline orange btn-block">立即下载</a>
        </p>
      </li>
      <li>
        <h1>快速赚佣金</h1>
        <p class="info">您可以通过这里发展您自己的客户 <br>
          每发生一笔操盘，您将赚得管理费50%的佣
          <br>金，可以随时兑换提取。</p>
        <img src="./images/index/wallet.png" alt="">
        <p class="btn-wrapper">
          <a href="./share.html" class="btn btn-orange outline orange btn-block">马上推广</a>
        </p>
      </li>
      <li>
        <div class="fl users-list">
          <h1>今日期货配资</h1>
          <div class="users">
            <p class="clearfix title">
              <span class="fl">用户名</span>
              <span class="fl">盈利金额(元)</span>
            </p>
            <div class="users-box">
              <div>
                <p class="clearfix">
                  <span class="fl">135****6235</span>
                  <span class="fl">3200.00</span>
                </p>
                <p class="clearfix">
                  <span class="fl">138****5698</span>
                  <span class="fl">3200.00</span>
                </p>
                <p class="clearfix">
                  <span class="fl">135****6235</span>
                  <span class="fl">3200.00</span>
                </p>
                <p class="clearfix">
                  <span class="fl">138****j5698</span>
                  <span class="fl">3200.00</span>
                </p>
                <p class="clearfix">
                  <span class="fl">133****5698</span>
                  <span class="fl">3200.00</span>
                </p>
                <p class="clearfix">
                  <span class="fl">137****5896</span>
                  <span class="fl">3200.00</span>
                </p>
                <p class="clearfix">
                  <span class="fl">130****2365</span>
                  <span class="fl">3200.00</span>
                </p>
                <p class="clearfix">
                  <span class="fl">139****5865</span>
                  <span class="fl">3200.00</span>
                </p>
                <p class="clearfix">
                  <span class="fl">139****8865</span>
                  <span class="fl">3200.00</span>
                </p>
                <p class="clearfix">
                  <span class="fl">139****5865</span>
                  <span class="fl">3200.00</span>
                </p>
                <p class="clearfix">
                  <span class="fl">139****5865</span>
                  <span class="fl">3200.00</span>
                </p>
                <p class="clearfix">
                  <span class="fl">139****5865</span>
                  <span class="fl">3200.00</span>
                </p>
              </div>
            </div>
          </div>
        </div>
      </li>
    </ul>
  </div>
  <div class="container process">
    <ul class="common-list">
      <li>
        <img src="./images/index/b1.png" alt="">
        <h1>1注册登录</h1>
      </li>
      <li>
        <img src="./images/index/b2.png" alt="">
        <h1>选择方案</h1>
      </li>
      <li>
        <img src="./images/index/b3.png" alt="">
        <h1>签订协议</h1>
      </li>
      <li>
        <img src="./images/index/b4.png" alt="">
        <h1>提交保证金</h1>
      </li>
      <li>
        <img src="./images/index/b5.png" alt="">
        <h1>发放账号</h1>
      </li>
    </ul>
  </div>
  <div class="footer">
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
    require(['js/index.js'])
  </script>
</body>
</html>
