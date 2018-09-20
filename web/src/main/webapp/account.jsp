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
      <h1 class="account-title">我的主页</h1>
      <div class="profile clearfix">
        <div class="avatar fl">
          <img src="./images/account/avator.jpg" alt="">
        </div>
        <div class="info fr">
          <p>当前权益</p>
          <h1>0.00 <small>元</small></h1>
          <p>
            <a href="./withdraw.jsp" class="btn btn-primary">出金</a>
            <a href="./recharge.jsp" class="btn btn-primary">入金</a>
          </p>
        </div>
      </div>

      <div class="account-info">
        <p>
          <span class="label">用户名</span>
          <span>晒太阳的小乌龟</span>
          <span>
            <i class="icon icon-checked"></i>
            已完成
          </span>
        </p>
        <p>
          <span class="label">真实姓名</span>
          <span>未认证</span>
          <span>
            <i class="icon icon-unchecked"></i>
            <a href="./authentication.jsp">认证</a>
          </span>
        </p>
        <p>
          <span class="label">手机号码</span>
          <span>13589098989</span>
          <span>
            <i class="icon icon-checked"></i>
            已绑定
          </span>
        </p>
        <p>
          <span class="label">银行卡</span>
          <span>未绑定</span>
          <span>
            <i class="icon icon-unchecked"></i>
            <a href="./bank-card.jsp">绑定</a>
          </span>
        </p>
      </div>
    </div>
  </div>
 <%@include file="../include/footer.jsp"%> 