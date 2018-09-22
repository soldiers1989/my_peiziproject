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
