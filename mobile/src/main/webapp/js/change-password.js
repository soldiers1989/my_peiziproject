require(['js/require-config'], function() {
  require(['jquery', 'utils', 'weui'], function($, utils) {
    $(function() {
      var $oldPswInput = $('#oldPassword');
      var $newPswInput = $('#newPassword');
      var $confirmPswInput = $('#confirmPassword');
      var $submitBtn = $('#submitBtn');
      var changePswUrl = '';

      $submitBtn.click(function(e) {
        e.preventDefault();

        var oldPassword = $oldPswInput.val().trim();
        var newPassword = $newPswInput.val().trim();
        var confirmPassword = $confirmPswInput.val().trim();

        if (oldPassword === '') {
          utils.errorToast('请输入原登录密码');
        } else if (newPassword === '') {
          utils.errorToast('请输入新密码');
        } else if (confirmPassword === '') {
          utils.errorToast('请确认新密码');
        } else if (newPassword !== confirmPassword) {
          utils.errorToast('两次输入的密码不一致');
        } else {
          $submitBtn.addClass('weui-btn_loading').text('加载中...');

          $.ajax({
            url: changePswUrl,
            method: 'POST',
            data: {
              password: oldPassword,
              newPassword: newPassword
            },
            success: function(resp) {
              console.log(resp);
            },
            error: function() {
              utils.errorToast('请求出错，请重试');
            },
            complete: function() {
              $submitBtn.removeClass('weui-btn_loading').text('确认修改');
            }
          });
        }
      });
    });
  });
});
