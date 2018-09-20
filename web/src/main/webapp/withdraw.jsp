<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="../include/header.jsp"%>
  <div class="account container">
    <div class="account-side fl">
      <h1 class="title">我的账户</h1>
      <ul class="side-menu">
        <li>
          <a href="#">
            <i class="fa fa-address-card"></i>
            我的账号
          </a>
          <ul class="sub-menu">
            <li>
              <a href="./account.html">个人主页</a>
            </li>
          </ul>
        </li>
        <li>
          <a href="#"><i class="fa fa-credit-card"></i>
            我的资金</a>
          <ul class="sub-menu">
            <li>
              <a href="./recharge.html">入金</a>
            </li>
            <li class="active">
              <a href="./withdraw.html">出金</a>
            </li>
          </ul>
        </li>
        <li>
          <a href="#"> <i class="fa fa-gear"></i> 系统操作</a>
          <ul class="sub-menu">
            <li>
              <a href="./change-password.html">修改密码</a>
            </li>
            <li>
              <a href="#">退出登录</a>
            </li>
          </ul>
        </li>
      </ul>
    </div>
    <div class="account-main fr recharge">
      <h1 class="account-title">出金</h1>
      <p class="sub-title">
        请认真填写提现信息
      </p>
      <form action="#" class="withdraw-form">
        <p class="form-item">
          <label for="">提现金额</label>
          <input type="text" name="amount" id="amount"
            placeholder="请输入提现金额">
          <span class="error"></span>
        </p>

        <p class="btn-wrapper">
          <button type="button" class="btn btn-block btn-primary"
            id="submitBtn">
            确认提现
          </button>
        </p>
      </form>
    </div>
  </div>
  <%@include file="../include/footer.jsp"%> 