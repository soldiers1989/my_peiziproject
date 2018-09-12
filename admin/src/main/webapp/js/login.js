require(['js/require-config'], function() {
  require(['jquery', 'utils', 'layer'], function($, utils, layer) {
    $(function() {
      var $loginForm = $('#loginForm');
      var $inputs = $loginForm.find('input');
      var $mobileInput = $('#mobile');
      var $pswInput = $('#password');
      var $codeInput = $('#code');
      var $errorTips = $('#errorTips');

      /**
       * 登录错误提示
       * @param {*} msg 提示信息
       */
      var showErrorTips = function(msg) {
        layer.msg(msg);
      };

      /**
       * 隐藏错误提示
       */
      var hideErrorTips = function() {
        $errorTips.css({
          visibility: 'hidden'
        });
      };

      // 焦点输入框时隐藏错误提示
      $inputs.focus(function() {
        hideErrorTips();
      });

      // 登录表单提交
      $loginForm.submit(function(e) {
        var $this = $(this);
        var mobile = $mobileInput.val().trim();
        var password = $pswInput.val().trim();
        var code = $codeInput.val().trim();

        hideErrorTips();

        if (mobile === '') {
          showErrorTips('请输入手机号码');
        } else if (!utils.checkMobile(mobile)) {
          showErrorTips('手机号码格式有误');
        } else if (password === '') {
          showErrorTips('请输入密码');
        } else if (code === '') {
          showErrorTips('请输入验证码');
        } else {
          $.ajax({
            url: '',
            method: 'POST',
            data: {
              mobile: mobile,
              password: password,
              code: code
            },
            success: function(resp) {
              console.log(resp);
            },
            error: function() {
              console.log('请求错误');
            }
          });
        }

        return false;
      });
    });
  });
});
