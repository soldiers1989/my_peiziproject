<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="header.jsp"%>
  <div class="swiper-container banner">
    <div class="container">
      <div class="banner-box fr">
        <div class="slogan">
          <p>您操盘，我出钱</p>
          <h1>目前免息操盘30天</h1>
          <h3>资金100%安全，100%实盘交易</h3>
        </div>
        <p class="btn-wrapper clearfix">
          <a href="./register.jsp" class="btn btn-block btn-primary register-btn fl">免费注册</a>
          <a href="./login.jsp" class="btn btn-block btn-primary login-btn fr">立即登录</a>
        </p>
      </div>
    </div>
    <div class="swiper-wrapper">
      <a class="swiper-slide" style="background:url('./images/index/banner1.png') no-repeat center center">
      </a>
      <a class="swiper-slide" style="background:url('./images/index/banner2.png') no-repeat center center">
      </a>
      <a class="swiper-slide" style="background:url('./images/index/banner3.png') no-repeat center center">
      </a>
      <a class="swiper-slide" style="background:url('./images/index/banner4.png') no-repeat center center">
      </a>
      <!-- <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div> -->
    </div>
    <div class="swiper-pagination"></div>
  </div>
  <div class="block">
    <div class="container">
      <div class="preview clearfix">
        <ul class="common-list data-preview fl">
          <li>
            <p>累计配资人数</p>
            <h1><strong id="countUp1" data-num="118768"></strong>
              <span>人</span></h1>
          </li>
          <li>
            <p>累计配资金额</p>
            <h1><strong id="countUp2" data-num="1954565896"></strong>
              <span>元</span></h1>
          </li>
          <li>
            <p>用户累计盈利</p>
            <h1><strong id="countUp3" data-num="195625632"></strong>
              <span>元</span></h1>
          </li>
          <li>
            <p>平台安全运营</p>
            <h1><strong id="countUp4" data-num="1298"></strong>
              <span>天</span></h1>
          </li>
        </ul>
      </div>
    </div>
  </div>
  <div class="block">
    <div class="container">
      <ul class="common-list introduction">
        <li>
          <img src="./images/index/i-1.png" alt="">
          <h1>灵活便捷</h1>
          <p>闪电提现，十分钟到账</p>
        </li>
        <li>
          <img src="./images/index/i-2.png" alt="">
          <h1>超低费用</h1>
          <p>最低1000元起配资，最高十倍杠杆</p>
        </li>
        <li>
          <img src="./images/index/i-3.png" alt="">
          <h1>真实安全</h1>
          <p>成交数据、资金第三方监管</p>
        </li>
        <li>
          <img src="./images/index/i-4.png" alt="">
          <h1>交易保障</h1>
          <p>采用博易、文华、知富专业期货交易
          </p>
        </li>
        <li>
          <img src="./images/index/i-5.png" alt="">
          <h1>专业服务</h1>
          <p>专业团队执业经验，有问必答</p>
        </li>
      </ul>
    </div>
  </div>

  <div class="container">
    <ul class="common-list capital">
      <li>
        <h1 class="title">免息配资</h1>
        <div class="item first">
          <div class="line">
            <h1>1000元起申请</h1>
          </div>
          <div class="line">
          </div>
        </div>
        <div class="item">
          <div class="line">
            <p>小投入</p>
            <p>盈利全归您 </p>
          </div>
          <div class="line">
            <p>大回报</p>
            <p>所有品种均可交易</p>
          </div>
        </div>
        <p class="before-btn">资金第三方托管 全实盘交易</p>
        <p class="btn-wrapper">
          <a href="./stock-free.jsp" class="btn outline orange btn-block">立即申请</a>
        </p>
      </li>
      <li>
        <h1 class="title title-p">按天配资</h1>
        <div class="item first">
          <div class="line">
            <h1>1000元起申请</h1>
          </div>
          <div class="line">
          </div>
        </div>
        <div class="item">
          <div class="line">
            <p>高杠杆 </p>
            <p>用几天算几天</p>
          </div>
          <div class="line">
            <p>高收益 </p>
            <p>最高可申请500万</p>
          </div>
        </div>
        <p class="before-btn">资金第三方托管 全实盘交易</p>
        <p class="btn-wrapper">
          <a href="./stock-day.jsp" class="btn outline orange btn-block">立即申请</a>
        </p>
      </li>
      <li>
        <h1 class="title title-b">按月配资</h1>
        <div class="item first">
          <div class="line">
            <h1>申请1-12个月</h1>
          </div>
          <div class="line">
          </div>
        </div>
        <div class="item">
          <div class="line">
            <p>低门槛 </p>
            <p>月息低至8厘</p>
          </div>
          <div class="line">
            <p>低利率 </p>
            <p>最高可申请1000万</p>
          </div>
        </div>
        <p class="before-btn">资金第三方托管 全实盘交易</p>
        <p class="btn-wrapper">
          <a href="./stock-month.jsp" class="btn outline orange btn-block">立即申请</a>
        </p>
      </li>
    </ul>
  </div>

  <div class="container">
    <ul class="common-list misc">
      <li>
        <h1>交易软件下载</h1>
        <p class="info">新用户注册并实名认证后 <br> 请下载安装此交易软件
          <br>&nbsp;</p>
        <img src="./images/index/software.png" alt="">
        <p class="btn-wrapper">
          <a href="./software.jsp" class="btn btn-orange outline orange btn-block">马上下载</a>
        </p>
      </li>
      <li>
        <h1>快速赚佣金</h1>
        <p class="info">您可以通过这里发展您自己的客户 <br>
          每发生一笔交易，您将赚得手续费70%的佣金
          <br>可以随时兑现提取</p>
        <img src="./images/index/wallet.png" alt="">
        <p class="btn-wrapper">
          <a href="./share.jsp" class="btn btn-orange outline orange btn-block">马上推广</a>
        </p>
      </li>
      <li>
        <div class="fl users-list">
          <h1>今日期货配资</h1>
          <div class="users">
            <p class="clearfix title">
              <span class="fl">用户名</span>
              <span class="fl">盈利金额</span>
            </p>
            <div class="users-box">
              <div>
                <p class="clearfix">
                  <span class="fl">
                    130****8888
                  </span>
                  <span class="fl">
                    <em> 958890</em>
                    <em>.80</em><em>元 </em>
                  </span></p>
                <p class="clearfix">
                  <span class="fl">
                    159****5686
                  </span>
                  <span class="fl">
                    <em class="red">
                      324800.50元 </em></span></p>
                <p class="clearfix">
                  <span class="fl">
                    180****7385
                  </span>
                  <span class="fl">
                    <em class="red">
                      83690.00元 </em></span></p>
                <p class="clearfix">
                  <span class="fl">
                    171****5690
                  </span>
                  <span class="fl">
                    <em class="red">
                      378906.00元 </em></span></p>
                <p class="clearfix">
                  <span class="fl">
                    139****2266
                  </span>
                  <span class="fl">
                    <em class="red">
                      268900.00元 </em></span></p>
                <p class="clearfix">
                  <span class="fl">
                    131****5880
                  </span>
                  <span class="fl">
                    <em class="red">
                      337895.00元 </em></span></p>
                <p class="clearfix">
                  <span class="fl">
                    158****7888
                  </span>
                  <span class="fl">
                    <em class="red">
                      866590.28元 </em></span></p>
                <p class="clearfix">
                  <span class="fl">
                    180****5599
                  </span>
                  <span class="fl">
                    <em class="red">
                      158906.00元 </em></span></p>
                <p class="clearfix">
                  <span class="fl">
                    138****6033
                  </span>
                  <span class="fl">
                    <em class="red">
                      683008.60元 </em></span></p>
                <p class="clearfix">
                  <span class="fl">
                    130****5380
                  </span>
                  <span class="fl">
                    <em class="red">
                      228856.00元 </em></span></p>
                <p class="clearfix">
                  <span class="fl">
                    132****5380
                  </span>
                  <span class="fl">
                    <em class="red">
                      180500.50元 </em></span></p>
                <p class="clearfix">
                  <span class="fl">
                    138****5590
                  </span>
                  <span class="fl">
                    <em class="red">
                      230060.00元 </em></span></p>
                <p class="clearfix">
                  <span class="fl">
                    180****1680
                  </span>
                  <span class="fl">
                    <em class="red">
                      130788.55元 </em></span></p>
                <p class="clearfix">
                  <span class="fl">
                    158****2399
                  </span>
                  <span class="fl">
                    <em class="red">
                      209005.00元 </em></span></p>
                <p class="clearfix">
                  <span class="fl">
                    139****8818
                  </span>
                  <span class="fl">
                    <em class="red">
                      155890.80元 </em></span></p>
                <p class="clearfix">
                  <span class="fl">
                    159****0780
                  </span>
                  <span class="fl">
                    <em class="red">
                      355856.20元 </em></span></p>
                <p class="clearfix">
                  <span class="fl">
                    134****3567
                  </span>
                  <span class="fl">
                    <em class="red">
                      225000.50元 </em></span></p>
                <p class="clearfix">
                  <span class="fl">
                    181****2266
                  </span>
                  <span class="fl">
                    <em class="red">
                      290860.00元 </em></span></p>
                <p class="clearfix">
                  <span class="fl">
                    139****5180
                  </span>
                  <span class="fl">
                    <em class="red">
                      103890.00元 </em></span></p>
                <p class="clearfix">
                  <span class="fl">
                    158****5567
                  </span>
                  <span class="fl">
                    <em class="red">
                      169079.00元 </em></span></p>
                <p class="clearfix">
                  <span class="fl">
                    139****2345
                  </span>
                  <span class="fl">
                    <em class="red">
                      680960.05元 </em></span></p>
                <p class="clearfix">
                  <span class="fl">
                    158****5588
                  </span>
                  <span class="fl">
                    <em class="red">
                      338090.50元 </em></span></p>
                <p class="clearfix">
                  <span class="fl">
                    180****5080
                  </span>
                  <span class="fl">
                    <em class="red">
                      136805.00元 </em></span></p>
                <p class="clearfix">
                  <span class="fl">
                    132****4678
                  </span>
                  <span class="fl">
                    <em class="red">
                      225670.80元 </em></span></p>
                <p class="clearfix">
                  <span class="fl">
                    131****2665
                  </span>
                  <span class="fl">
                    <em class="red">
                      377006.00元 </em></span></p>
                <p class="clearfix">
                  <span class="fl">
                    181****5188
                  </span>
                  <span class="fl">
                    <em class="red">
                      375700.00元 </em></span></p>
                <p class="clearfix">
                  <span class="fl">
                    132****9678
                  </span>
                  <span class="fl">
                    <em class="red">
                      376689.00元 </em></span></p>
                <p class="clearfix">
                  <span class="fl">
                    139****1008
                  </span>
                  <span class="fl">
                    <em class="red">
                      237802.98元 </em></span></p>
                <p class="clearfix">
                  <span class="fl">
                    181****1288
                  </span>
                  <span class="fl">
                    <em class="red">
                      28905.68元 </em></span></p>
                <p class="clearfix">
                  <span class="fl">
                    158****6658
                  </span>
                  <span class="fl">
                    <em class="red">
                      28905.68元 </em></span></p>
                <p class="clearfix">
                  <span class="fl">
                    132****2389
                  </span>
                  <span class="fl">
                    <em class="red">
                      38090.90元</em></span></p>
                <p class="clearfix">
                  <span class="fl">
                    130****1188
                  </span>
                  <span class="fl">
                    <em class="red">
                      90080.00元</em></span></i>

              </div>
            </div>
          </div>
        </div>
      </li>
    </ul>
  </div>
  <div class="container process">
    <ul class="common-list">
      <li>
        <img src="./images/index/b1.png" alt="">
        <h1>1.注册登录</h1>
      </li>
      <li>
        <img src="./images/index/b2.png" alt="">
        <h1>2.选择方案</h1>
      </li>
      <li>
        <img src="./images/index/b3.png" alt="">
        <h1>3.签订协议</h1>
      </li>
      <li>
        <img src="./images/index/b4.png" alt="">
        <h1>4.提交保证金</h1>
      </li>
      <li>
        <img src="./images/index/b5.png" alt="">
        <h1>5.发放账号</h1>
      </li>
    </ul>
  </div>
   <!-- 合作伙伴 友情链接 -->
  <div class="container pal">
    <div class="index-tab">
      <a href="#partner" class="active">合作伙伴</a>
      <span>/</span>
      <a href="#links">友情链接</a>
    </div>
    <div class="index-content">
      <div class="partner" id="partner">
        <ul class="clearfix">
          <li class="fl">
            <a href="http://www.shfe.com.cn/" target="_blank"
              title="上海期货交易所官网">
              <img src="./images/index/shfe.jpg" alt="">
            </a>
          </li>
          <li class="fl">
            <a href="http://www.dce.com.cn/" target="_blank"
              title="大连商品交易所官网">
              <img src="./images/index/dce.jpg" alt="">
            </a>
          </li>
          <li class="fl">
            <a href="http://www.czce.com.cn/" target="_blank"
              title="郑州商品交易所官网">
              <img src="./images/index/czce.jpg" alt="">
            </a>
          </li>
          <li class="fl">
            <a href="http://www.cffex.com.cn/" target="_blank"
              title="中国金融期货交易所官网">
              <img src="./images/index/cffex.jpg" alt="">
            </a>
          </li>
          <li class="fl">
            <a href="http://www.haqh.com/" target="_blank"
              title="华安期货官网">
              <img src="./images/index/haqh.jpg" alt="">
            </a>
          </li>
          <li class="fl">
            <a href="http://www.alqh.com/" target="_blank"
              title="安粮期货官网">
              <img src="./images/index/alqh.jpg" alt="">
            </a>
          </li>
          <li class="fl">
            <a href="http://www.gyqh.net/" target="_blank"
              title="广州金控期货官网">
              <img src="./images/index/gyqh.jpg" alt="">
            </a>
          </li>
          <li class="fl">
            <a href="http://www.cmbchina.com/" target="_blank"
              title="招商银行官网">
              <img src="./images/index/cmb.jpg" alt="">
            </a>
          </li>
        </ul>
      </div>
      <div class="links" id="links">
        <ul class="clearfix">
          <li class="fl">
            <a href="http://www.csrc.gov.cn/" target="_blank"
              title="中国证监会官网">
              <img src="./images/index/csrc.jpg" alt="">
            </a>
          </li>
          <li class="fl">
            <a href="http://www.cfachina.org/" target="_blank"
              title="中国期货业协会官网">
              <img src="./images/index/qhxh.jpg" alt="">
            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>

 <%@include file="footer.jsp"%> 
   <script src="<%=basePath%>/js/libs/require.min.js"></script>
  <script>
    require(['js/index.js'])
  </script>
