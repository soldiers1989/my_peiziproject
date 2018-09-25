<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="header.jsp"%>
<body class="has-all" data-type="day">
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
    <a href="javascript:;" class="weui-flex__item active">
      <span>按天配资</span>
    </a>
    <a href="./stock-month.jsp" class="weui-flex__item">
      <span>按月配资</span>
    </a>
  </div>

  <div class="product-detail">
    <div class="product-info">
      <p class="sub-title">
        <img src="./images/common/info.png" alt="">
        <span>按天支付配资利息， 节假日不收费</span>
      </p>
      <h1 class="multiple">
        10<small> 倍</small>
      </h1>
      <p class="multiple-info">
        最高10倍杠杆
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
            <option value="" disabled="disabled">介于1-10倍之间</option>
            <option value="1" data-rate="0.05" selected="selected">1倍</option>
            <option value="2" data-rate="0.05">2倍</option>
            <option value="3" data-rate="0.05">3倍</option>
            <option value="4" data-rate="0.05">4倍</option>
            <option value="5" data-rate="0.05">5倍</option>
            <option value="6" data-rate="0.05">6倍</option>
            <option value="7" data-rate="0.05">7倍</option>
            <option value="8" data-rate="0.05">8倍</option>
            <option value="9" data-rate="0.05">9倍</option>
            <option value="10" data-rate=0.051">10倍</option>
          </select>
        </div>
      </div>
      <div class="weui-cell weui-cell_select weui-cell_select-after">
        <div class="weui-cell__hd">
          <label for="duration" class="weui-label">操盘期限</label>
        </div>
        <div class="weui-cell__bd">
          <select name="duration" id="deadline" class="weui-select">
            <option disabled="disabled">介于2 - 30天之间</option>
            <option value="2" selected>2天</option>
            <option value="3">3天</option>
            <option value="4">4天</option>
            <option value="5">5天</option>
            <option value="6">6天</option>
            <option value="7">7天</option>
            <option value="8">8天</option>
            <option value="9">9天</option>
            <option value="10">10天</option>
            <option value="11">11天</option>
            <option value="12">12天</option>
            <option value="13">13天</option>
            <option value="14">14天</option>
            <option value="15">15天</option>
            <option value="16">16天</option>
            <option value="17">17天</option>
            <option value="18">18天</option>
            <option value="19">19天</option>
            <option value="20">20天</option>
            <option value="21">21天</option>
            <option value="22">22天</option>
            <option value="23">23天</option>
            <option value="24">24天</option>
            <option value="25">25天</option>
            <option value="26">26天</option>
            <option value="27">27天</option>
            <option value="28">28天</option>
            <option value="29">29天</option>
            <option value="30">30天</option>
          </select>
        </div>
      </div>
    </div>
    <div class="weui-cells__title">资金明细</div>
    <div class="weui-cells">
      <div class="weui-cell"><label class="weui-label">利息</label>
        <div class="weui-cell__bd">
          <div class="weui-cell__container">
            <div class="num-xxl"><span class="money-num" id="interest">2.00</span>
              元
            </div>
            <div class="formula">
              <span id="interestFormula">1000 x 1 x 0.05% x
                2天</span>
              (利息先付后用)
            </div>
          </div>
        </div>
      </div>
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
      <div class="weui-cell">
        <label class="weui-label">准备资金</label>
        <div class="weui-cell__bd">
          <div class="weui-cell__container">
            <div class="num-xxl"><span class="money-num" id="prepareFunds">1002.00</span>
              元
            </div>
            <div class="formula" id="prepareFundsFormula">1000保证金
              + 2.00元利息</div>
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
            <span class="money-num" id="closeAmount">1300</span>
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

<%@include file="footer.jsp"%> 
<script src="./js/libs/require.min.js"></script>
<script>
  require(['js/pz.js'])
</script>

