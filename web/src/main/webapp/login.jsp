<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="header.jsp"%>
  <div class="login-banner">
    <div class="container">
      <h1>专注期货配资十年</h1>
      <h1>您身边的配资专家</h1>
      <form action="#" class="login-form" id="loginForm">

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
          <input type="text" placeholder="验证码" class="verif-code-input"
            id="code">
          <i class="random-code" id="randomCode">FHGH</i>
          <a href="#">刷新</a>
        </p>
        <p class="find-psw">
          <a href="./find-password.html">找回密码</a>
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
   <%@include file="footer.jsp"%> 