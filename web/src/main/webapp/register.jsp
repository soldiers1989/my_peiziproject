<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="header.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	getuid();
});


function getuid(){
	var RESTFUL_BASE = serviceurl.baseurl;
    $.ajax({
        url: RESTFUL_BASE+"/web/user/getuid",
        type: 'GET',
        dataType: 'text',
        success: function(data){
            $("#uid").val(data);
        }
    });
}

</script>
  <div class="register">
    <div class="container">
      <form action="#" class="register-form">
        <input type="hidden" id="uid" name="uid" value="">
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
   <%@include file="footer.jsp"%> 
<script src="<%=basePath%>/js/libs/require.min.js"></script>
<script>
  require(['js/register.js'])
</script>