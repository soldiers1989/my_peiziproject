<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="header.jsp"%>
<body class="has-all">
  <!-- 顶部导航栏 -->
  <div class="header">
    <div class="hd-center">
      <h1 class="title">
        header页面
      </h1>
    </div>
  </div>
  <!-- banner -->
  <div class="swiper-container">
    <div class="swiper-wrapper">
      <a href="#" class="swiper-slide"><img src="./images/home/banner1.png"
          alt="">
      </a>
      <a href="#" class="swiper-slide"><img src="./images/home/banner2.png"
          alt="">
      </a>
      <a href="#" class="swiper-slide"><img src="./images/home/banner3.png"
          alt="">
      </a>
      <a href="#" class="swiper-slide"><img src="./images/home/banner4.png"
          alt="">
      </a>
    </div>
    <div class="swiper-pagination"></div>
  </div>
  <!-- intro -->
  <div class="weui-flex intro">
    <div class="weui-flex__item">
      <div class="weui-flex">
        <div class="text">
          <h2>资金保障</h2>
          <p>资金第三方托管</p>
        </div>
        <div class="icon">
          <img src="./images/home/safe.png" alt="">
        </div>
      </div>
    </div>
    <div class="weui-flex__item">
      <div class="weui-flex">
        <div class="text">
          <h2>快捷提现</h2>
          <p>十五分钟到账</p>
        </div>
        <div class="icon">
          <img src="./images/home/quick.png" alt="">
        </div>
      </div>
    </div>
  </div>

  <!-- 菜单 -->
  <div class="weui-flex index-menu mt-12">
    <a href="./stock-free.jsp" class="weui-flex__item">
      <img src="./images/home/m1.png" alt="">
      <p>免息配资</p>
    </a>
    <a href="./stock-day.jsp" class="weui-flex__item">
      <img src="./images/home/m2.png" alt="">
      <p>按天配资</p>
    </a>
    <a href="./stock-month.jsp" class="weui-flex__item">
      <img src="./images/home/m3.png" alt="">
      <p>按月配资</p>
    </a>
    <a href="./software.jsp" class="weui-flex__item">
      <img src="./images/home/m4.png" alt="">
      <p>交易软件</p>
    </a>
    <a href="./share.jsp" class="weui-flex__item">
      <img src="./images/home/m5.png" alt="">
      <p>我要推广</p>
    </a>
    <a href="./register.jsp" class="weui-flex__item">
      <img src="./images/home/m6.png" alt="">
      <p>免费注册</p>
    </a>
  </div>

  <!-- 指数 -->
  <!-- <div class="exponent mt-12">
    <div class="title">
      <i class="title-block"></i>
      <span>
        国内指数
      </span>
    </div>
    <div class="weui-flex">
      <div class="weui-flex__item">
        <p>上证指数</p>
        <h3>2737.76767</h3>
        <div>
          <span>-31.546</span>
          <span>-1.14%</span>
        </div>
      </div>
      <div class="weui-flex__item">
        <p>深证指数</p>
        <h3>
          8552.80
        </h3>
        <div>
          <span>-31.546</span>
          <span>-1.14%</span>
        </div>
      </div>
    </div>
  </div> -->
<%@include file="footer.jsp"%> 
<script src="./js/libs/require.min.js"></script>
<script>
    require(['js/index.js'])
</script>