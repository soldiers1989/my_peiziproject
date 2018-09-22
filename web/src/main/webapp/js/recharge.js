require(['js/require-config'], function() {
  require(['jquery', 'tabs', 'layer'], function($, tabs, layer) {
    $(function() {
      tabs.init();

      var $rechargeAmountInput = $('#rechargeAmount');
      var $accNumberInput = $('#accNumber');
      var $rechargeTypeInput = $('#rechargeType');
      var $submitBtn = $('#submitBtn');
      var $accountInput = $('#account');
      
      $submitBtn.click(function() {
        var rechargeAmount = $rechargeAmountInput.val().trim();
        var accNumber = $accNumberInput.val().trim();
        var rechargeType = $rechargeTypeInput.val().trim();
        var account = $accountInput.val();
        if (rechargeAmount === '') {
          layer.msg('请输入充值金额');
        } else if (accNumber === '') {
          layer.msg('请输入充值账单流水号');
        } else if (rechargeType === '') {
          layer.msg('请输入充值方式');
        } else {
          $.ajax({
            url: '/service/web/inrecord/save',
            method: 'POST',
            data: {
              rechargeAmount: rechargeAmount,
              accNumber: accNumber,
              rechargeType: rechargeType,
              account:account
            },
            success: function(resp) {
              if (resp.resultCode === 0) {
            	  console.log(resp);
            	  alert("提交成功");
            	  window.location.href = "./recharge.jsp";
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
