require(['js/require-config'], function() {
  require(['jquery', 'utils', 'weui'], function($, utils) {
    $(function() {
      var $submitBtn = $('#submitBtn');
      var $withdrawAmount = $('#withdrawAmount');
      var $accountInput = $('#account');
      $submitBtn.click(function() {
        var amount = $withdrawAmount.val().trim();
        var account = $accountInput.val();
        if (amount === '') {
          utils.errorToast('请输入提现金额');
        } else {
          $.ajax({
            url: '/service/web/outrecord/save',
            method: 'POST',
            data: {
              amount: amount,
              account:account
            },
            success: function(resp) {
            	if (resp.resultCode === 0) {
              	  console.log(resp);
              	  alert("提交成功");
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
