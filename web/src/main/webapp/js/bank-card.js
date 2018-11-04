require(['js/require-config'], function() {
  require(['jquery', 'utils', 'layer'], function($, utils, layer) {
    $(function() {
      var $nameInput = $('#name');
      var $bankInput = $('#bank');
      var $codeNumberInput = $('#codeNumber');
      var $submitBtn = $('#submitBtn');
      var $accountInput = $('#account');

      $submitBtn.click(function() {
        var bank = $bankInput.val().trim();
        var codeNumber = $codeNumberInput.val().trim();
        var account = $accountInput.val();
        var name = $nameInput.val().trim();

        if (name === '') {
          layer.msg('请输入客户名称');
        } else if (!isNaN(+name)) {
          layer.msg('客户名称不能为数字');
        } else if (bank === '') {
          layer.msg('请输入开户行名称');
        } else if (!isNaN(bank)) {
          layer.msg('开户行名称不能为数字');
        } else if (codeNumber === '') {
          layer.msg('请输入您的银行卡号');
        } else if (isNaN(+codeNumber)) {
          layer.msg('银行卡号必须为数字');
        } else {
          $.ajax({
            url: '/service/web/user/bankauth',
            method: 'POST',
            data: {
              bank: bank,
              codeNumber: codeNumber,
              account: account
            },
            success: function(resp) {
              if (resp.resultCode === 0) {
                console.log(resp);
                alert('绑定成功');
                window.location.href = './account.jsp';
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
