require(['js/require-config'], function() {
  require(['jquery', 'utils', 'layer'], function($, utils, layer) {
    $(function() {
      var $realNameInput = $('#realName');
      var $codeNumberInput = $('#codeNumber');
      var $submitBtn = $('#submitBtn');
      var $accountInput = $('#account');
 
      $submitBtn.click(function() {
        var realName = $realNameInput.val().trim();
        var codeNumber = $codeNumberInput.val().trim();
        var account = $accountInput.val();

        if (realName === '') {
          layer.msg('请输入您的真实姓名');
        } else if (codeNumber === '') {
          layer.msg('请输入真实身份证号码');
        } else {
          $.ajax({
              url: '/service/web/user/centauth',
              method: 'POST',
            data: {
              realName: realName,
              codeNumber: codeNumber,
              account:account
            },
            success: function(resp) {
            	if (resp.resultCode === 0) {
              	  console.log(resp);
              	  window.location.href = "./account.jsp";
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
