<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="header.jsp"%>

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
            <li class="active">
              <a href="./recharge.html">入金</a>
            </li>
            <li>
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
      <h1 class="account-title">入金</h1>
      <p class="sub-title">
        选择充值方式
      </p>
      <div class="tabs recharge-tabs">
        <div class="tab-control">
          <a href="#" class="tab-control-item active"
            data-target="quick">
            快捷支付
          </a>
          <a href="#" class="tab-control-item" data-target="offline">
            线下充值
          </a>
          <a href="http://lcppay.com/a/payment/paymentInfo/money?account=NTc3MTAwMQ"
            class="tab-control-item" target="_blank">
            第三方充值
          </a>
        </div>
        <div class="tab-contents">
          <div class="tab-content quick">
            <div class="clearfix">
              <div class="fl alipay">
                <img src="./images/account/alipay.jpg" alt="">
              </div>
              <div class="fl wepay">
                <img src="./images/account/wepay.jpg" alt="">
              </div>
            </div>
            <p class="notice">扫码的时候，备注一下用户名，充值成功联系在线客服优先办理入金
            </p>
            <div class="recharge-notice">
              <h2>温馨提示：</h2>
              <p>1. 请您根据自身真实情况填写，98配资网会对用户的所有资料进行严格保密。</p>
              <p>2. 使用过程中遇到问题，请及时联系客服。郭经理：电话/微信：18311187611
                QQ：761369662 刘经理：电话/微信：18612226789 QQ
                ：215772907 </p>
            </div>
          </div>
          <div class="tab-content offline" style="display:none;">
            <div class="recharge-notice blue">
              <p>
                &diams; 请准确填写您的充值金额和帐单流水号。
              </p>
              <p>
                &diams; 线下充值返利1%。
              </p>
            </div>
            <h1 class="offline-recharge-title">开户名： 刘炜</h1>
            <h1 class="offline-recharge-title">账户号：6214830113533649
            </h1>
            <h1 class="offline-recharge-title">开户地址：招商银行北京分行海淀支行</h1>
            <form action="#" class="offline-recharge-form">
              <p class="form-item">
                <label for="">充值金额</label>
                <input type="text" id="rechargeAmount"
                  placeholder="请输入充值金额">
                <span class="error"></span>
              </p>
              <p class="form-item">
                <label for="">账单流水号</label>
                <input type="text" id="accNumber"
                  placeholder="请输入账单流水号">
                <span class="error"></span>
              </p>
              <p class="form-item">
                <label for="">充值方式</label>
                <input type="text" name="mobile" id="rechargeType"
                  placeholder="请输入充值方式">
                <span>(如网银转帐，柜台汇款,汇款人等)</span>
                <span class="error"></span>
              </p>

              <p class="btn-wrapper">
                <button type="button" class="btn btn-block btn-primary"
                  id="submitBtn">
                  确认充值
                </button>
              </p>
            </form>
            <div class="recharge-notice">
              <h2>温馨提示：</h2>
              <p>1. 请您根据自身真实情况填写，98配资网会对用户的所有资料进行严格保密。</p>
              <p>2. 使用过程中遇到问题，请及时联系客服。郭经理：电话/微信：18311187611
                QQ：761369662 刘经理：电话/微信：18612226789 QQ
                ：215772907 </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
   <%@include file="footer.jsp"%> 