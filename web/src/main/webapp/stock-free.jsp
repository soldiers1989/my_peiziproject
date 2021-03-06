<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="header.jsp"%>
  <div class="stock-banner">
  </div>
  <div class="stock-type">
    <div class="container">
      <ul class="common-list">
        <li class="active">
          <a href="./stock-free.jsp">免息配资</a>
        </li>
        <li>
          <a href="./stock-day.jsp">按天配资</a>
        </li>
        <li>
          <a href="./stock-month.jsp">按月配资</a>
        </li>
      </ul>
    </div>
  </div>

  <div class="container stock-block" id="stock" data-type="free">
    <ul class="common-list stock-setting">
      <li>
        <input type="number" placeholder="" value="1000" id="marginInput">
        <p>保证金</p>
      </li>
      <li>
        <select name="" id="multipleSelect">
          <option value="1" selected>1倍</option>
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
        <p>配资杠杆</p>
      </li>
      <li>
        <select name="" id="tradeTimesSelect">
          <option value="30" selected>30天</option>
        </select>
        <p>操盘天数</p>
      </li>
    </ul>
    <div class="interest">
      <div class="plus">
        <img src="./images/stock/plus.png" alt="">
      </div>
      <div class="equal">
        <img src="./images/stock/equal.png" alt="">
      </div>
      <h2>您需要准备的资金：</h2>
      <ul class="common-list">
        <li>
          <div class="amount" id="marginAmount">
            1000
          </div>
          <p>保证金（元）</p>
        </li>
        <li>
          <div class="amount" id="interestAmount">
            1000
          </div>
          <p>日利息（元）</p>
        </li>
        <li>
          <div class="amount" id="prepareFundsAmount">
            1000
          </div>
          <p>准备资金（元）</p>
        </li>
      </ul>
    </div>
    <div class="table-wrapper">
      <table>
        <tbody>
          <tr>
            <td>总操盘资金</td>
            <td>
              <h1>
                <span id="total">2000</span>元
              </h1>
            </td>
            <td>
              获得资金
            </td>
            <td>
              <h1>
                <span id="funds">1000</span>元
              </h1>
            </td>
          </tr>
          <tr>
            <td>亏损警戒线</td>
            <td>
              <h1><span id="lossLine">1500</span>元</h1>
              <small><span>（获得资金X1.05） </span></small>
            </td>
            <td>亏损平仓线</td>
            <td>
              <h1><span id="closeLine">1200</span>元</h1>
              <small><span>（获得资金X1.03） </span></small>
            </td>
          </tr>
          <tr>
            <td>
              交易时间
            </td>
            <td colspan="3">
              <label class="trading-day"><input type="radio"
                  name="startDate" class="start-date" value="1"
                  checked="checked">
                今日</label>
              <label class="trading-day">
                <input type="radio" name="startDate" class="start-date"
                  value="2">
                下个交易日</label>
            </td>
          </tr>
          <tr>
            <td>
              操盘须知
            </td>
            <td colspan="3">
              投资国内期货，盈利全归您
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <p class="text-center agree">
      <input type="checkbox" id="weuiAgree"  >
      <label for="agree">
        我已阅读并同意 <a href="./protocol.jsp" target="_blank">98配资网操盘协议</a>
      </label>
    </p>
    <p class="btn-wrapper">
      <a href="#" class="btn btn-primary btn-block" id="stockBtn">
        我要配资
      </a>
    </p>
  </div>

  <div class="precautions container">
    <ul class="tabs">
      <li class="tab-item active">
        注意事项
      </li>
    </ul>

    <ol class="precautions-list">
      <li><em>1</em>本金1000元起步，1000元的整数倍均可，最高10倍。</li>
      <li><em>2</em>免管理费，仅收取交易手续费，不交易则无任何费用，盈利全归您。</li>
      <li><em>3</em>交易日上午9:05～下午15:30随时出金结算，方便灵活。</li>
      <li><em>4</em>国内四大交易所原油、股指、黄金、白银、豆粕、螺纹等所有期货主力和次主力合约均可交易。</li>
      <li><em>5</em>交易时间：上午9:00～10:15、10:30～11:30，下午13：30～15:00，夜盘大多从21:00～23:30，各品种规则不同，以交易所为准。</li>
      <li><em>6</em>过午持仓不做限制。下午收盘到晚上开盘，晚上收盘到第二天早上开盘，隔夜持仓资金不得超过自有保证金的2倍，超出部分系统收盘前3分钟自动强平处理。同一品种临近涨跌停板0.3%，不得新开及持有反向单，否则将进行平仓处理。</li>
      <li><em>7</em>亏损平仓线：期货波动十分快速，当总操盘资金资金低于平仓线时，系统将自动平仓。为避免平仓发生，请时刻关注本金是否充足。</li>
      <li><em>8</em>98配资网提醒您：期市有风险，投资需谨慎！</li>
    </ol>
  </div>
   <%@include file="footer.jsp"%> 
<script src="./js/libs/require.min.js"></script>
<script>
  require(['js/stock.js'])
</script>
