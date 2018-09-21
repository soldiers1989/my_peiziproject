require(['js/require-config'], function() {
  require(['jquery', 'utils', 'layer'], function($, utils, layer) {
    $(function() {
      var $bankInput = $('#bank');
      var $codeNumberInput = $('#codeNumber');
      var $submitBtn = $('#submitBtn');
      var $accountInput = $('#account');
      $submitBtn.click(function() {
        var bank = $bankInput.val().trim();
        var codeNumber = $codeNumberInput.val().trim();
        var account = $accountInput.val();
        if (bank === '') {
          layer.msg('请输入开户行名称');
        } else if (codeNumber === '') {
          layer.msg('请输入您的银行卡号');
        } else {
          $.ajax({
              url: '/service/web/user/bankauth',
              method: 'POST',
            data: {
              bank: bank,
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
