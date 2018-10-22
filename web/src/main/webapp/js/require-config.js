define(function() {
  require.config({
    baseUrl: './js',
    paths: {
      jquery: 'libs/jquery-2.1.4',
      Swiper: 'libs/swiper.min',
      countUp: 'libs/countUp.min',
      base: 'base',
      tabs: 'tabs',
      Qs: 'libs/qs.min',
      Clipboard: 'libs/clipboard.min',
      layer: 'libs/layer'
    },
    shim: {
      Swiper: ['jquery']
    }
  });

  require(['jquery'], function($) {
    $(function() {
      $('.close-online').click(function() {
        var $this = $(this);
        var $icon = $this.find('i');
        $('.fixed-right').toggleClass('hide');

        if ($icon.hasClass('fa-angle-double-right')) {
          $icon
            .removeClass('fa-angle-double-right')
            .addClass('fa-angle-double-left');
        } else {
          $icon
            .addClass('fa-angle-double-right')
            .removeClass('fa-angle-double-left');
        }
      });

      $('head').append(
        ' <link rel="shortcut icon" href="./images/favicon.ico">'
      );

      // 根据链接激活菜单项
      var $links = $('.nav').find('a');
      $links.each(function() {
        var url = window.location.href;

        var $this = $(this);
        var href = $this.attr('href');
        href = href.replace('./', '');

        if (url.indexOf(href) !== -1) {
          $this.parent('li').addClass('active');
        }
      });

      // 根据链接地址动态修改title
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
          title: '注册协议'
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
          keyword: 'recharge',
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
          keyword: 'protocol',
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
