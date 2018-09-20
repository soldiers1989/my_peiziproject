require(['js/require-config'], function() {
  require(['jquery', 'utils', 'layer'], function($, utils, layer) {
    $(function() {
      var $mobileInput = $('#mobile');
      var $codeInput = $('#code');
      var $passwordInput = $('#password');
      var $confirmPasswordInput = $('#confirmPassword');
      var $submitBtn = $('#submitBtn');
      var $getCodeBtn = $('#getCodeBtn');

      // 获取验证码
      $getCodeBtn.click(function() {
        var $this = $(this);
        var mobile = $mobileInput.val().trim();

        if (mobile === '') {
          layer.msg('请输入手机号码');
        } else if (!utils.checkMobile(mobile)) {
          layer.msg('输入的手机号码格式有误');
        } else {
          if (!$this.hasClass('disabled')) {
            $.ajax({
              url: '',
              data: {
                mobile: mobile
              },
              success: function(resp) {
                utils.countDown($this, 5);
              }
            });
          }
        }
      });

      // 注册提交
      $submitBtn.click(function() {
        var mobile = $('#mobile')
          .val()
          .trim();
        var code = $codeInput.val().trim();
        var password = $passwordInput.val().trim();
        var confirmPassword = $confirmPasswordInput.val().trim();

        if (mobile === '') {
          layer.msg('请输入手机号码');
        } else if (!utils.checkMobile(mobile)) {
          layer.msg('输入的手机号码有误');
        } else if (code === '') {
          layer.msg('请输入验证码');
        } else if (password === '') {
          layer.msg('请输入密码');
        } else if (confirmPassword === '') {
          layer.msg('请确认密码');
        } else if (password !== confirmPassword) {
          layer.msg('两次输入的密码不一致');
        } else {
          var loading = layer.load();

          $.ajax({
            url: '',
            method: 'POST',
            data: {
              mobile: mobile,
              code: code,
              password: password
            },
            success: function(resp) {
              layer.close(loading);

              console.log(resp);
            },
            error: function() {
              layer.close(loading);
            }
          });
        }
      });
    });
  });
});
