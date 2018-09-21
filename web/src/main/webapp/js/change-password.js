require(['js/require-config'], function() {
  require(['jquery', 'utils', 'layer'], function($, utils, layer) {
    $(function() {

      var $oldPasswordInput = $('#oldPassword');
      var $newPasswordInput = $('#newPassword');
      var $confirmPasswordInput = $('#confirmPassword');
      var $submitBtn = $('#submitBtn');
      var $accountInput = $('#account');
      var account = $accountInput.val().trim();
      $submitBtn.click(function(e) {
        e.preventDefault();
        var oldPassword = $oldPasswordInput.val().trim();
        var newPassword = $newPasswordInput.val().trim();
        var confirmPassword = $confirmPasswordInput.val().trim();
        var account = $accountInput.val().trim();
        if (oldPassword === '') {
          layer.msg('请输入原密码');
        } else if (newPassword === '') {
          layer.msg('请输入新密码');
        } else if (confirmPassword === '') {
          layer.msg('请确认新密码');
        } else if (confirmPassword !== newPassword) {
          layer.msg('两次输入的密码不一致');
        } else {
          $.ajax({
        	  url: '/service/web/user/modifypassword',
        	  method: 'POST',
            data: {
              oldPassword: oldPassword,
              newPassword: newPassword,
              account:account
            },
            success: function(resp) {
              if (resp.resultCode === 0) {
            	  console.log(resp);
            	  window.location.href = "./change-password.jsp";
                } else {
              	 alert(resp.resultMessage);
                }
            }
          });
        }
      });
    });
  });
});
