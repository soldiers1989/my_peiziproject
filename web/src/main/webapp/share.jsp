<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="../include/header.jsp"%>
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
        <li class="active">
          <a href="./share.html">我要推广</a>
        </li>
      </ul>
    </div>
  </div>
  <div class="share-bg">
  </div>
  <div class="share-code">
    <label for="">您的推广链接</label>
    <input type="text" value="123123213" id="input"
      readonly>
    <button id="copyBtn" class="btn" data-clipboard-target="#input">复制</button>
  </div>
   <%@include file="../include/footer.jsp"%> 