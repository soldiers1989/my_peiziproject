require(['js/require-config'], function() {
  require(['jquery', 'utils', 'weui'], function($, utils) {
    $(function() {
      var $nameInput = $('#name');
      var $submitBtn = $('#submitBtn');
      var $bankInput = $('#bank');
      var $numberInput = $('#number');

      var $accountInput = $('#account');
      $submitBtn.click(function() {
        var name = $nameInput.val().trim();
        var bank = $bankInput.val().trim();
        var number = $numberInput.val().trim();
        var account = $accountInput.val();

        if (name === '') {
          utils.errorToast('请输入客户姓名');
        } else if (!isNaN(+name)) {
          utils.errorToast('客户姓名不能为数字');
        } else if (bank === '') {
          utils.errorToast('请输入开户行名称');
        } else if (!isNaN(+bank)) {
          utils.errorToast('开户行名称不能为数字');
        } else if (number === '') {
          utils.errorToast('请输入银行卡号');
        } else if (isNaN(+number)) {
          utils.errorToast('银行卡号必须为数字');
        } else {
          $.ajax({
            url: '/service/web/user/bankauth',
            method: 'POST',
            data: {
              bank: bank,
              codeNumber: number,
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
