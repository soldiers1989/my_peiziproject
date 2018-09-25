require(['js/require-config'], function() {
  require(['jquery', 'utils', 'weui'], function($, utils) {
    $(function() {
      var $submitBtn = $('#submitBtn');
      var $withdrawAmount = $('#withdrawAmount');

      $submitBtn.click(function() {
        var amount = $withdrawAmount.val().trim();

        if (amount === '') {
          utils.errorToast('请输入提现金额');
        } else {
          $.ajax({
            url: '',
            method: 'POST',
            data: {
              amount: amount
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
