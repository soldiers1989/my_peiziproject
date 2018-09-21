<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="header.jsp"%>
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
          <input type="text" placeholder="验证码" class="verif-code-input" id="code">
          <i class="random-code" id="randomCode"><span id="checkCode"></span></i>
          <a href="#" onclick="createCode(4);">刷新</a>
        </p>
        <p class="find-psw">
          <a href="./find-password.jsp">找回密码</a>
        </p>
        <p class="form-item">
          <button class="btn btn-orange btn-block">登录</button>
        </p>
        <p class="text-center">
          还没有账号？
          <a href="./register.jsp" class="register-link">免费注册</a>
        </p>
      </form>
    </div>
  </div>
   <%@include file="footer.jsp"%> 
<script src="<%=basePath%>/js/libs/require.min.js"></script>
<script>
  require(['js/login.js'])
</script>