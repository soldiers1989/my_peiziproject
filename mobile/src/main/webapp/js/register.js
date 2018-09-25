require(['js/require-config'], function() {
  require(['jquery', 'utils', 'weui'], function($, utils) {
    $(function() {
      var $usernameInput = $('#username');
      var $mobileInput = $('#mobile');
      var $vcodeInput = $('#vcode');
      var $pswInput = $('#password');
      var $confirmPswInput = $('#confirmPsw');
      var $getCodeBtn = $('#getCodeBtn');
      var $registerBtn = $('#registerBtn');
      var getCodeApiUrl = '/service/web/code/send';
      var registerApiUrl = '/service/web/user/register';
      var timer = null;
      var $uidInput = $('#uid');
      var $remdPhoneInput = $('#remdPhone');
      
      /**
       * 获取验证码按钮倒计时
       * @param {*} btn 执行倒计时的按钮，
       * @param {*} second 倒计时间隔秒数
       */
      var btnCountDown = function($btn, seconds) {
        var text = $btn.text();

        $btn.text(seconds + '秒后重新获取').addClass('disabled');
        clearInterval(timer);

        timer = setInterval(function() {
          seconds--;
          if (seconds === 0) {
            clearInterval(timer);
            $btn.text(text).removeClass('disabled');
          } else {
            $btn.text(seconds + '秒后重新获取');
          }
        }, 1000);
      };

      // 获取验证码
      $getCodeBtn.click(function() {
        var mobile = $mobileInput.val().trim();
        var uid = $uidInput.val().trim();
        var $this = $(this);

        if (!utils.checkMobile(mobile)) {
          utils.errorToast('手机号码格式有误');
        } else {
          $.ajax({
            url: getCodeApiUrl,
            method: 'POST',
            data: {
            	uid:uid,
              mobile: mobile
            },
            success: function(resp) {
              if (resp.resultCode === 0) {
            	  utils.successToast('验证码已发送');
                  btnCountDown($this, 60);
                } else {
              	 alert(resp.resultMessage);
                }
            }
          });
        }
      });

      // 注册
      $registerBtn.click(function(e) {
        e.preventDefault();

        var $this = $(this);
        var mobile = $mobileInput.val().trim();
        var vcode = $vcodeInput.val().trim();
        var password = $pswInput.val().trim();
        var confirmPsw = $confirmPswInput.val().trim();
        var uid = $uidInput.val().trim();
        var remdPhone = $remdPhoneInput.val().trim();
        if (!utils.checkMobile(mobile)) {
          utils.errorToast('手机号码格式有误');
        } else if (utils.isBlank(vcode)) {
          utils.errorToast('请输入验证码');
        } else if (utils.isBlank(password)) {
          utils.errorToast('请输入密码');
        } else if (utils.isBlank(confirmPsw)) {
          utils.errorToast('请确认密码');
        } else if (password !== confirmPsw) {
          utils.errorToast('两次输入密码不一致');
        } else {
          var data = {
            uid:uid,
            mobile: mobile,
            code: vcode,
            password: password,
            remdPhone:remdPhone
          };

          $this.addClass('weui-btn_loading');

          $.ajax({
            url: registerApiUrl,
            method: 'POST',
            data: data,
            success: function(resp) {

              if (resp.resultCode === 0) {
                  window.location.href = "./loginServlet?account=" + mobile;
                  console.log(resp);
               } else {
             	 alert(resp.resultMessage);
               }
            },
            complete: function() {
              $this.removeClass('weui-btn_loading');
            }
          });
        }
      });
    });
  });
});
