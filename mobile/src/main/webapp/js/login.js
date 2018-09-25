require(['js/require-config'], function() {
  require(['jquery', 'utils', 'weui'], function($, utils) {
    $(function() {
      var $mobileInput = $('#mobile');
      var $pswInput = $('#password');
      var $loginBtn = $('#loginBtn');
      var loginApiUrl = '';

      $loginBtn.click(function(e) {
        e.preventDefault();

        var mobile = $mobileInput.val().trim();
        var password = $pswInput.val().trim();

        if (mobile === '') {
          utils.errorToast('请输入手机号码');
        } else if (!utils.checkMobile(mobile)) {
          utils.errorToast('手机号码格式错误');
        } else if (password === '') {
          utils.errorToast('请输入密码');
        } else {
          $loginBtn.addClass('weui-btn_loading').text('登录中...');

          $.ajax({
            url: loginApiUrl,
            method: 'POST',
            data: {
              mobile: mobile,
              password: password
            },
            success: function(resp) {
              console.log(resp);
            },
            error: function() {
              utils.errorToast('请求出错，请重试');
            },
            complete: function() {
              $loginBtn.removeClass('weui-btn_loading').text('登录');
            }
          });
        }
      });
    });
  });
});
