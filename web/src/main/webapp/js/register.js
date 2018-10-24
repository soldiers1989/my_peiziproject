require(['js/require-config'], function() {
  require(['jquery', 'utils', 'layer'], function($, utils, layer) {
    $(function() {
      var $mobileInput = $('#mobile');
      var $codeInput = $('#code');
      var $passwordInput = $('#password');
      var $confirmPasswordInput = $('#confirmPassword');
      var $submitBtn = $('#submitBtn');
      var $getCodeBtn = $('#getCodeBtn');
      var $uidInput = $('#uid');
      var $remdPhoneInput = $('#remdPhone');
     
      // 获取验证码
      $getCodeBtn.click(function() {
        var $this = $(this);
        var mobile = $mobileInput.val().trim();
        var uid = $uidInput.val().trim();
        if (mobile === '') {
          layer.msg('请输入手机号码');
        } else if (!utils.checkMobile(mobile)) {
          layer.msg('输入的手机号码格式有误');
        } else {
          if (!$this.hasClass('disabled')) {
            $.ajax({
              url: '/service/web/code/send',
              method: 'POST',
              data: {
            	uid: uid,
                mobile: mobile
              },
              success: function(resp) {
            	  if (resp.resultCode === 0) {
                 	 utils.countDown($this, 60);
                   } else {
                 	 alert(resp.resultMessage);
                   }
              }
            });
          }
        }
      });

      // 注册提交
      $submitBtn.click(function() {
	    var agreeCheckbox = $('#weuiAgree');
	  	if(!agreeCheckbox.is(':checked')){
	  		alert("请仔细阅读注册服务协议并且同意,进行注册！");
	  		return false;
	  	}
        var mobile = $('#mobile').val().trim();
        var code = $codeInput.val().trim();
        var password = $passwordInput.val().trim();
        var confirmPassword = $confirmPasswordInput.val().trim();
        var uid = $uidInput.val().trim();
        var remdPhone = $remdPhoneInput.val().trim();
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
              password: password,
              remdPhone:remdPhone
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
