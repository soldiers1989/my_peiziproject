require(['js/require-config'], function() {
  require(['jquery', 'layer'], function($, layer) {
    $(function() {
      var $submitBtn = $('#submitBtn');
      var $amountInput = $('#amount');
      var $accountInput = $('#account');
      $submitBtn.click(function() {
        var amount = $amountInput.val().trim();
        var account = $accountInput.val();
        if (amount === '') {
          layer.msg('请输入提现金额');
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
            	  window.location.href = "./withdraw.jsp";
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
