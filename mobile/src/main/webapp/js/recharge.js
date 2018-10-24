require(['js/require-config'], function() {
  require(['jquery', 'utils', 'weui'], function($, utils) {
    $(function() {
      var $tabs = $('.tabs');
      var $tabLinks = $tabs.children('a');
      var $tabContent = $('.recharge-content');
      var $submitBtn = $('#submitBtn');
      var $amountInput = $('#amount');
      //var $numberInput = $('#number');
      //var $typeInput = $('#type');
      var $accountInput = $('#account');
      var $bankCodeInput = $('#bankCode');
      
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
        //var number = $numberInput.val().trim();
        //var type = $typeInput.val().trim();
        var account = $accountInput.val();
        var bankCode = $bankCodeInput.val();
        if (amount === '') {
          utils.errorToast('请输入充值金额');
        } else {
          $.ajax({
            url: '/service/web/inrecord/save',
            method: 'POST',
            data: {
            	rechargeAmount: amount,
            	account:account
            },
            success: function(resp) {
              if (resp.resultCode === 0) {
            	  alert("入金记录提交成功!");
            	  $.ajax({
           	        url: "/service/web/user/getamount/"+account,
           	        type: 'GET',
           	        dataType: 'json',
           	        success: function(data){
           	        	
           	        	//http://lcppay.com/a/payment/sandpay/gopay?account=5771001&rmb=5015.00&dollar=5000.00&bankCode=01050000&rage=2.00
           	        	var jiaoYiAccount=data.account;
           	        	
           	        	if (jiaoYiAccount == null){
           	        		alert("该用户没未分配交易帐号，不能进行入金操作！");
           	        		return false;
           	        	}
           	        	
           	        	var dollar = parseFloat(amount).toFixed(2);
           	        	var rmb = (parseFloat(amount) + parseFloat(amount)*0.003).toFixed(2);
           	        	var jiaoYiRate = "0.00"
           	        	var redirectUrl= "http://lcppay.com/a/payment/sandpay/gopay?account="+ jiaoYiAccount+"&rmb="+ rmb +"&dollar="+ dollar+ "&bankCode=" + bankCode + "&rate=" + jiaoYiRate;
           	           	window.location.href = redirectUrl;
           	        	
           	        }
              		});
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
