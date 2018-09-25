require(['js/require-config'], function() {
  require(['jquery', 'utils', 'weui'], function($, utils) {
    $(function() {
      var $tabs = $('.tabs');
      var $tabLinks = $tabs.children('a');
      var $tabContent = $('.recharge-content');
      var $submitBtn = $('#submitBtn');
      var $amountInput = $('#amount');
      var $numberInput = $('#number');
      var $typeInput = $('#type');
      var $accountInput = $('#account');
      
      $tabLinks.click(function(e) {
        var $this = $(this);
        var target = $this.data('target');
        if (target) {
          e.preventDefault();
          if (!$this.hasClass('active')) {
            $this
              .addClass('active')
              .siblings()
              .removeClass('active');

            $('.' + target)
              .show()
              .siblings('.recharge-content')
              .hide();
          }
        }
      });

      $submitBtn.click(function() {
        var amount = $amountInput.val().trim();
        var number = $numberInput.val().trim();
        var type = $typeInput.val().trim();
        var account = $accountInput.val();
        
        if (amount === '') {
          utils.errorToast('请输入充值金额');
        } else if (number === '') {
          utils.errorToast('请输入流水单号');
        } else if (type === '') {
          utils.errorToast('请输入充值方式');
        } else {
          $.ajax({
            url: '/service/web/inrecord/save',
            method: 'POST',
            data: {
            	rechargeAmount: amount,
            	accNumber: number,
            	rechargeType: type,
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
