define(['jquery'], function($) {
  var Utils = function() {};

  Utils.prototype.checkMobile = function(mobile) {
    var mobileReg = /^1(3|4|5|7|8)\d{9}$/;
    return mobileReg.test(mobile);
  };

  Utils.prototype.isBlank = function(arg) {
    return !arg || arg === '' || typeof arg === 'undefined';
  };

  Utils.prototype.countDown = function($el, seconds) {
    var timer;
    var countDown = function(scds) {
      $el.addClass('disabled').text(scds + '秒');
    };

    if ($el.hasClass('disabled')) {
      return;
    }

    countDown(seconds);

    timer = setInterval(function() {
      seconds--;
      countDown(seconds);

      if (seconds === 0) {
        clearInterval(timer);
        $el.removeClass('disabled').text('获取验证码');
      }
    }, 1000);
  };

  var utils = new Utils();
  return utils;
});
