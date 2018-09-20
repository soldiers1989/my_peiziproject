<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="../include/header.jsp"%>


  <div class="account container clearfix">
    <div class="account-side fl">
      <h1 class="title">我的账户</h1>
      <ul class="side-menu">
        <li>
          <a href="#">
            <i class="fa fa-address-card"></i>
            我的账号
          </a>
          <ul class="sub-menu">
            <li class="active">
              <a href="./account.jsp">个人主页</a>
            </li>
          </ul>
        </li>
        <li>
          <a href="#"><i class="fa fa-credit-card"></i>
            我的资金</a>
          <ul class="sub-menu">
            <li>
              <a href="./recharge.jsp">入金</a>
            </li>
            <li>
              <a href="./withdraw.jsp">出金</a>
            </li>
          </ul>
        </li>
        <li>
          <a href="#"> <i class="fa fa-gear"></i> 系统操作</a>
          <ul class="sub-menu">
            <li>
              <a href="./change-password.jsp">修改密码</a>
            </li>
            <li>
              <a href="#">退出登录</a>
            </li>
          </ul>
        </li>
      </ul>
    </div>
    <div class="account-main fr">
      <h1 class="account-title">身份认证</h1>
      <div class="auth clearfix">
        <form action="#">
          <p class="form-item">
            <label for="">真实姓名</label>
            <input type="text" name="realName" placeholder="请输入您的真实姓名"
              id="realName">
          </p>
          <p class="form-item">
            <label for="">身份证号码</label>
            <input type="text" name="codeNumber"
              placeholder="请输入您的身份证号码" id="codeNumber">
          </p>
          <p class="btn-wrapper">
            <button type="button" class="btn btn-block btn-primary"
              id="submitBtn">
              认证
            </button>
          </p>

        </form>
      </div>
    </div>
  </div>
 <%@include file="../include/footer.jsp"%> 