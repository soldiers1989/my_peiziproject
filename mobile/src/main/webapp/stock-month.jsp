<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="header.jsp"%>
<body class="has-all" data-type="month">
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
    <a href="./stock-free.jsp" class="weui-flex__item">
      <span>免息配资</span>
    </a>
    <a href="./stock-day.jsp" class="weui-flex__item">
      <span>按天配资</span>
    </a>
    <a href="javascript:;" class="weui-flex__item active">
      <span>按月配资</span>
    </a>
  </div>

  <div class="product-detail">
    <div class="product-info">
      <p class="sub-title">
        <img src="./images/common/info.png" alt="">
        <span>时间长，利率低，适合长线操盘
        </span>
      </p>
      <h1 class="multiple">
        0.8<small> %</small>
      </h1>
      <p class="multiple-info">
        最低利率
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
            pattern="[0-9]*" placeholder="介于 100 - 5000.00万之间"
            value="1000" maxlength="11">
        </div>
      </div>
      <div class="weui-cell weui-cell_select weui-cell_select-after">
        <div class="weui-cell__hd">
          <label for="" class="weui-label">杠杆率</label>
        </div>
        <div class="weui-cell__bd">
          <select class="weui-select" id="leverage" name="select2">
            <option value="" disabled>介于1-10倍之间</option>
            <option value="1" data-rate="0.8" selected>1倍</option>
            <option value="2" data-rate="0.8">2倍</option>
            <option value="3" data-rate="0.8">3倍</option>
            <option value="4" data-rate="0.8">4倍</option>
            <option value="5" data-rate="0.8">5倍</option>
            <option value="6" data-rate="0.8">6倍</option>
            <option value="7" data-rate="0.8">7倍</option>
            <option value="8" data-rate="0.8">8倍</option>
            <option value="9" data-rate="0.8">9倍</option>
            <option value="10" data-rate="0.8">10倍</option>
          </select>
        </div>
      </div>
      <div class="weui-cell weui-cell_select weui-cell_select-after">
        <div class="weui-cell__hd">
          <label for="duration" class="weui-label">操盘期限</label>
        </div>
        <div class="weui-cell__bd">
          <select name="duration" id="deadline" class="weui-select">
            <option value="" disabled="disabled">
              介于1 - 12个月之间
            </option>
            <option value=" 1" selected="selected">1月</option>
            <option value="2">2月</option>
            <option value="3">3月</option>
            <option value="4">4月</option>
            <option value="5">5月</option>
            <option value="6">6月</option>
            <option value="7">7月</option>
            <option value="8">8月</option>
            <option value="9">9月</option>
            <option value="10">10月</option>
            <option value="11">11月</option>
            <option value="12">12月</option>
          </select>
        </div>
      </div>
    </div>
    <div class="weui-cells__title">资金明细</div>
    <div class="weui-cells">
      <div class="weui-cell"><label class="weui-label">利息</label>
        <div class="weui-cell__bd">
          <div class="weui-cell__container">
            <div class="num-xxl"><span class="money-num
             "
                id="interest">8.00</span>
              元
            </div>
            <div class="formula">
              <span id="interestFormula">1000 x 1 x 0.8%</span>
              (利息先付后用)
            </div>
          </div>
        </div>
      </div>
      <div class="weui-cell">
        <label class="weui-label">总操盘金额</label>
        <div class="weui-cell__bd">
          <div class="weui-cell__container">
            <div class="num-xxl"><span class="money-num
             "
                id="totalTradingAmount">2000</span>
              元
            </div>
            <div class="">保证金 + 获得资金</div>
          </div>
        </div>
      </div>
      <div class="weui-cell">
        <label class="weui-label">准备资金</label>
        <div class="weui-cell__bd">
          <div class="weui-cell__container">
            <div class="num-xxl"><span class="money-num
             "
                id="prepareFunds">1008.00</span>
              元
            </div>
            <div class="formula" id="prepareFundsFormula">1000保证金
              + 8.00元利息</div>
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
        阅读并同意 <a href="./contract.jsp">《配资相关条款》</a>
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
    <a href="./index.jsp" class="weui-tabbar__item">
      <div class="weui-tabbar__icon">
        <img src="./images/tabbar/home-off.png" alt="">
      </div>
      <p class="weui-tabbar__label">首页</p>
    </a>
    <a href="./stock-day.jsp" class="weui-tabbar__item weui-bar__item--on">
      <div class="weui-tabbar__icon">
        <img src="./images/tabbar/stock-on.png" alt="">
      </div>
      <p class="weui-tabbar__label">股票配资</p>
    </a>

    <a href="./account.jsp" class="weui-tabbar__item">
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

