require(['js/require-config'], function() {
  require(['jquery', 'tabs', 'layer'], function($, tabs, layer) {
    $(function() {
      tabs.init();

      var $rechargeAmountInput = $('#rechargeAmount');
      var $accNumberInput = $('#accNumber');
      var $rechargeTypeInput = $('#rechargeType');
      var $submitBtn = $('#submitBtn');

      $submitBtn.click(function() {
        var rechargeAmount = $rechargeAmountInput.val().trim();
        var accNumber = $accNumberInput.val().trim();
        var rechargeType = $rechargeTypeInput.val().trim();

        if (rechargeAmount === '') {
          layer.msg('请输入充值金额');
        } else if (accNumber === '') {
          layer.msg('请输入充值账单流水号');
        } else if (rechargeType === '') {
          layer.msg('请输入充值方式');
        } else {
          $.ajax({
            url: '',
            data: {
              rechargeAmount: rechargeAmount,
              accNumber: accNumber,
              rechargeType: rechargeType
            },
            success: function(resp) {
              console.log(resp);
            }
          });
        }
      });
    });
  });
});
