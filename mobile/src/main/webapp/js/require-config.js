define(function() {
  require.config({
    baseUrl: 'js',
    paths: {
      jquery: 'libs/jquery-2.1.4',
      weui: 'libs/jquery-weui.min',
      FastClick: 'libs/fastclick',
      Swiper: 'libs/swiper.min',
      base: 'base',
      utils: 'utils',
      Qs: 'libs/qs.min',
      Clipboard: 'libs/clipboard.min'
    },
    shim: {
      weui: ['jquery'],
      Swiper: ['jquery']
    }
  });

  require(['FastClick'], function(FastClick) {
    FastClick.attach(document.body);
  });

  require(['jquery'], function($) {
    $('head').append(' <link rel="shortcut icon" href="./images/favicon.ico">');

    var websiteMap = [
      {
        keyword: 'index',
        title: '首页'
      },
      {
        keyword: 'stock-free',
        title: '免息配资'
      },
      {
        keyword: 'stock-day',
        title: '按天配资'
      },
      {
        keyword: 'stock-month',
        title: '按月配资'
      },
      {
        keyword: 'stock-enter',
        title: '配资确认'
      },
      {
        keyword: 'software',
        title: '交易软件'
      },
      {
        keyword: 'share',
        title: '我的推广'
      },
      {
        keyword: 'login',
        title: '登录'
      },
      {
        keyword: 'register',
        title: '注册'
      },
      {
        keyword: 'registration-agreement',
        title: '注册服务协议'
      },
      {
        keyword: 'find-password',
        title: '找回密码'
      },
      {
        keyword: 'account',
        title: '个人中心'
      },
      {
        keyword: 'personal-info',
        title: '个人资料'
      },
      {
        keyword: 'verified',
        title: '实名认证'
      },
      {
        keyword: 'bind-bank-card',
        title: '绑定银行卡'
      },
      {
        keyword: 'recharge-type',
        title: '入金'
      },
      {
        keyword: 'withdraw',
        title: '出金'
      },
      {
        keyword: 'change-password',
        title: '修改密码'
      },
      {
        keyword: 'company-profile',
        title: '公司简介'
      },
      {
        keyword: 'contact-us',
        title: '联系我们'
      },
      {
        keyword: 'contract',
        title: '合作操盘协议'
      }
    ];
    var suffix = '98配资网';

    var url = window.location.href;

    for (var i = 0; i < websiteMap.length; i++) {
      var item = websiteMap[i];
      if (url.indexOf(item.keyword) > -1) {
        $('title').text(item.title + '-' + suffix);
      }
    }
  });
});

// $(function() {
//   // fastclick
//   FastClick.attach(document.body);
//   $.toast.prototype.defaults.duration = 1200;
// });
// var Utils = function() {};

// Utils.prototype.checkMobile = function(mobile) {
//   var mobileReg = /^1(3|4|5|7|8)\d{9}$/;
//   return mobileReg.test(mobile);
// };

// Utils.prototype.isBlank = function(arg) {
//   return !arg || arg === '' || typeof arg === 'undefined';
// };

// Utils.prototype.errorToast = function(msg) {
//   $.toast(msg, 'cancel');
// };

// Utils.prototype.successToast = function(msg) {
//   $.toast(msg);
// };

// var utils = new Utils();
