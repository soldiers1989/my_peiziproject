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
