<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;"
    name="viewport" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="./css/libs/weui.min.css">
  <link rel="stylesheet" href="./css/libs/jquery-weui.min.css">
  <link rel="stylesheet" href="./css/main.css">
  <title>免息配资-股票配资</title>
</head>
<body class="has-all" data-type="free">
  <!-- 顶部导航栏 -->
  <div class="header">
    <div class="hd-left">
      <a href="javascript:history.back()" class="back-btn">
        <img src="./images/common/back.png" alt="">
      </a>
    </div>
    <div class="hd-center">
      <h1 class="title">
        股票配资
      </h1>
    </div>
  </div>

  <div class="weui-flex tabs">
    <a href="javascript:;" class="weui-flex__item active">
      <span>免息配资</span>
    </a>
    <a href="./stock-day.html" class="weui-flex__item">
      <span>按天配资</span>
    </a>
    <a href="./stock-month.html" class="weui-flex__item">
      <span>按月配资</span>
    </a>
  </div>

  <div class="product-detail">
    <div class="product-info">
      <p class="sub-title">
        <img src="./images/common/info.png" alt="">
        <span>免息配资，平台不收取利息，盈利七成归您</span>
      </p>
      <h1 class="multiple">
        0<small> 利息</small>
      </h1>
      <p class="multiple-info">
        不收管理费
      </p>
      <p class="rules">
        最高可操盘 <span>5000.00万元</span> 起配资金 <span>1000元</span>
      </p>
    </div>
    <div class="weui-cells__title">配资设置</div>
    <div class="weui-cells">
      <div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label">保证金</label></div>
        <div class="weui-cell__bd">
          <input class="weui-input" id="margin" type="number"
            pattern="[0-9]*" placeholder="介于 1000 - 5000.00万之间"
            value="1000" maxlength="11">
        </div>
      </div>
      <div class="weui-cell weui-cell_select weui-cell_select-after">
        <div class="weui-cell__hd">
          <label for="" class="weui-label">杠杆率</label>
        </div>
        <div class="weui-cell__bd">
          <select class="weui-select" id="leverage" name="select2">
            <option value="1" selected="selected">1倍</option>
            <option value="2">2倍</option>
            <option value="3">3倍</option>
            <option value="4">4倍</option>
            <option value="5">5倍</option>
            <option value="6">6倍</option>
            <option value="7">7倍</option>
            <option value="8">8倍</option>
            <option value="9">9倍</option>
            <option value="10">10倍</option>
          </select>
        </div>
      </div>
      <div class="weui-cell weui-cell_select weui-cell_select-after">
        <div class="weui-cell__hd">
          <label for="duration" class="weui-label">操盘期限</label>
        </div>
        <div class="weui-cell__bd">
          <select name="duration" id="deadline" class="weui-select">
            <option value="30" disabled="disabled" selected="selected">30天</option>
          </select>
        </div>
      </div>
    </div>
    <div class="weui-cells__title">资金明细</div>
    <div class="weui-cells">
      <div class="weui-cell">
        <label class="weui-label">总操盘金额</label>
        <div class="weui-cell__bd">
          <div class="weui-cell__container">
            <div class="num-xxl"><span class="money-num" id="totalTradingAmount">2000</span>
              元
            </div>
            <div class="">保证金 + 获得资金</div>
          </div>
        </div>
      </div>
    </div>
    <div class="weui-cells__title">操盘规则</div>
    <div class="weui-cells">
      <div class="weui-cell">
        <label class="weui-label">预警线</label>
        <div class="weui-cell__bd">
          <p>
            <span class="money-num" id="warningAmount">1500</span>
            元
          </p>
        </div>
      </div>
      <div class="weui-cell">
        <label class="weui-label">平仓线</label>
        <div class="weui-cell__bd">
          <p>
            <span class="money-num" id="closeAmount">1200</span>
            元
          </p>
        </div>
      </div>
      <div class="weui-cell weui-cell_select weui-cell_select-after">
        <div class="weui-cell__hd">
          <label for="" class="weui-label">交易时间</label>
        </div>
        <div class="weui-cell__bd">
          <select class="weui-select" id="startDate">
            <option value="1" selected="selected">今天</option>
            <option value="2">下个交易日</option>
          </select>
        </div>
      </div>
    </div>
    <span for="weuiAgree" class="weui-agree">
      <input id="weuiAgree" type="checkbox" checked class="weui-agree__checkbox"
        disabled>
      <span class="weui-agree__text">
        阅读并同意 <a href="./contract.html">《配资相关条款》</a>
      </span>
    </span>
    <div class="weui-btn-area">
      <a class="weui-btn weui-btn_primary">
        立即申请
      </a>
    </div>
  </div>


  <!-- tabbar -->
  <div class="weui-tabbar">
    <a href="./index.html" class="weui-tabbar__item">
      <div class="weui-tabbar__icon">
        <img src="./images/tabbar/home-off.png" alt="">
      </div>
      <p class="weui-tabbar__label">首页</p>
    </a>
    <a href="./stock-day.html" class="weui-tabbar__item weui-bar__item--on">
      <div class="weui-tabbar__icon">
        <img src="./images/tabbar/stock-on.png" alt="">
      </div>
      <p class="weui-tabbar__label">股票配资</p>
    </a>
    <a href="./account.html" class="weui-tabbar__item">
      <div class="weui-tabbar__icon">
        <img src="./images/tabbar/account-off.png" alt="">
      </div>
      <p class="weui-tabbar__label">我的账户</p>
    </a>
  </div>
  </div>

  <script src="./js/libs/require.min.js"></script>
  <script>
    require(['js/pz.js'])
  </script>

</body>
</html>
