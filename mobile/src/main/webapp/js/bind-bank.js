require(['js/require-config'], function() {
  require(['jquery', 'utils', 'weui'], function($, utils) {
    $(function() {
      var $submitBtn = $('#submitBtn');
      var $bankInput = $('#bank');
      var $numberInput = $('#number');
      var $accountInput = $('#account');
      $submitBtn.click(function() {
        var bank = $bankInput.val().trim();
        var number = $numberInput.val().trim();
        var account = $accountInput.val();
        if (bank === '') {
          utils.errorToast('请输入开户行名称');
        } else if (number === '') {
          utils.errorToast('请输入银行卡号');
        } else {
          $.ajax({
            url: '/service/web/user/bankauth',
            method: 'POST',
            data: {
              bank: bank,
              codeNumber: number,
              account:account
            },
            success: function(resp) {
              if (resp.resultCode === 0) {
	          	  console.log(resp);
	          	  alert("绑定成功");
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
