define(['jquery', 'weui'], function($) {
  $.toast.prototype.defaults.duration = 1000;
  var Utils = function() {};

  Utils.prototype.checkMobile = function(mobile) {
    var mobileReg = /^1(3|4|5|7|8)\d{9}$/;
    return mobileReg.test(mobile);
  };

  Utils.prototype.isBlank = function(arg) {
    return !arg || arg === '' || typeof arg === 'undefined';
  };

  Utils.prototype.errorToast = function(msg) {
    $.toast(msg, 'cancel');
  };

  Utils.prototype.successToast = function(msg) {
    $.toast(msg);
  };

  var utils = new Utils();
  return utils;
});
