	  alert(12313132);
require(['js/require-config'], function() {
  require(['jquery', 'utils', 'layer'], function($, utils, layer) {
	  alert(12313132);

      // 注册提交
      $submitBtn.click(function() {
    	  alert(123123);
        var mobile = $('#mobile').val().trim();
        var code = $codeInput.val().trim();
        var password = $passwordInput.val().trim();
        var confirmPassword = $confirmPasswordInput.val().trim();
        var uid = $uidInput.val().trim();
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
            url: '/service/web/user/register',
            method: 'POST',
            data: {
              uid:uid,
              mobile: mobile,
              code: code,
              password: password
            },
            success: function(resp) {
              if (resp.resultCode === 0) {
            	  layer.close(loading);
                  window.location.href = "./loginServlet?account=" + mobile;
                  console.log(resp);
               } else {
             	 alert(resp.resultMessage);
               }
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
