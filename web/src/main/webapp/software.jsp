<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="header.jsp"%>
  <div class="software-banner">
    <div class="container clearfix">
      <div class="money fl">
        <img src="./images/software/money.png" alt="">
      </div>
      <div class="download">
        <div class="slogan">
          <h1>期货交易软件</h1>
          <p>不再是旁观者，属于您自己的交易软件</p>
        </div>
        <div class="btn-wrapper" id="downloadLinks">
          <a href="http://bucket.elanxiang.com/Download/setup%20zdqh.exe">
            <i class="fa fa-windows"></i>
            电脑版下载
          </a>
          <a href="#">
            <div class="app-qrcode">
              <img src="./images/software/ios.png" alt="">
            </div>
            <i class="fa fa-apple"></i>苹果版下载
          </a>
          <a href="#">
            <div class="app-qrcode">
              <img src="./images/software/android.png" alt="">
            </div>
            <i class="fa fa-android"></i>安卓版下载
          </a>
        </div>
        <div class="software-info">
          <p>
            1.
            电脑版下载：点击下载博易大师软件，行情账号zdqh、密码123456，交易站点选择电信联通20。
          </p>
          <p>
            2.
            手机版下载：扫描二维码下载知富软件，无需行情账号、密码；无需选择交易站点，直接登录交易端。
          </p>
        </div>
      </div>
    </div>
  </div>
<%@include file="footer.jsp"%>
<script src="./js/libs/require.min.js"></script>
<script>
  require(['js/software.js'])
</script>
