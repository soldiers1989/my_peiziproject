require(['js/require-config'], function() {
  require(['jquery', 'layer'], function($, layer) {
    $(function() {
      var $submitBtn = $('#submitBtn');
      var $amountInput = $('#amount');

      $submitBtn.click(function() {
        var amount = $amountInput.val().trim();
        if (amount === '') {
          layer.msg('请输入提现金额');
        } else {
          $.ajax({
            url: '',
            method: 'POST',
            success: function(resp) {
              console.log(resp);
            }
          });
        }
      });
    });
  });
});
