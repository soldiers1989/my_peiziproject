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

        if (amount === '') {
          utils.errorToast('请输入充值金额');
        } else if (number === '') {
          utils.errorToast('请输入流水单号');
        } else if (type === '') {
          utils.errorToast('请输入充值方式');
        } else {
          $.ajax({
            url: '',
            method: 'POST',
            data: {
              amount: amount,
              number: number,
              type: type
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
