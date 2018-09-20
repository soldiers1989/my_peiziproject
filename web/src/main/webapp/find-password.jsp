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
          <label for="">新密码</label>
          <input type="password" name="password"
            placeholder="请输入新密码" id="password">
        </p>
        <p class="form-item">
          <label for="">确认新密码</label>
          <input type="password" id="confirmPassword"
            placeholder="请确认新密码">
        </p>
        <p class="btn-wrapper">
          <button class="btn btn-block btn-primary" type="button"
            id="submitBtn">
            提交
          </button>
        </p>
      </form>
    </div>
  </div>
   <%@include file="../include/footer.jsp"%> 