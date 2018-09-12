require(['js/require-config'], function() {
  require(['jquery', 'utils', 'layer'], function($, utils, layer) {
    $(function() {
      var $bankInput = $('#bank');
      var $codeNumberInput = $('#codeNumber');
      var $submitBtn = $('#submitBtn');

      $submitBtn.click(function() {
        var bank = $bankInput.val().trim();
        var codeNumber = $codeNumberInput.val().trim();

        if (bank === '') {
          layer.msg('请输入开户行名称');
        } else if (codeNumber === '') {
          layer.msg('请输入您的银行卡号');
        } else {
          $.ajax({
            url: '',
            data: {
              bank: bank,
              codeNumber: codeNumber
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
