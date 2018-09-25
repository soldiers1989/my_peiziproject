require(['js/require-config'], function() {
  require(['jquery', 'utils', 'weui'], function($, utils) {
    $(function() {
      var $submitBtn = $('#submitBtn');
      var $bankInput = $('#bank');
      var $numberInput = $('#number');

      $submitBtn.click(function() {
        var bank = $bankInput.val().trim();
        var number = $numberInput.val().trim();

        if (bank === '') {
          utils.errorToast('请输入开户行名称');
        } else if (number === '') {
          utils.errorToast('请输入银行卡号');
        } else {
          $.ajax({
            url: '',
            method: 'POST',
            data: {
              bank: bank,
              number: number
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
