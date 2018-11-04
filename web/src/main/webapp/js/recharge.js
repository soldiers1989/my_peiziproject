require(['js/require-config'], function() {
  require(['jquery', 'tabs', 'layer'], function($, tabs, layer) {
    $(function() {
      tabs.init();

      var $rechargeAmountInput = $('#rechargeAmount');
      var $submitBtn = $('#submitBtn');
      var $accountInput = $('#account');
      var $bankCodeInput = $('#bankCode');
      $submitBtn.click(function() {
        var rechargeAmount = $rechargeAmountInput.val().trim();
        var account = $accountInput.val();
        var bankCode = $bankCodeInput.val();
        if (rechargeAmount === '') {
          layer.msg('请输入充值金额');
        }  else {
        	$.ajax({
                url: '/service/web/inrecord/save',
                method: 'POST',
                data: {
                  rechargeAmount: rechargeAmount,
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
               	        	
               	        	var dollar = parseFloat(rechargeAmount).toFixed(2);
               	        	var rmb = (parseFloat(rechargeAmount) + parseFloat(rechargeAmount)*0.003).toFixed(2);
               	        	var jiaoYiRate = "0.00"
               	        	var redirectUrl= "http://lcppay.com/a/payment/sandpay/gopay?account="+ jiaoYiAccount+"&rmb="+ rmb +"&dollar="+ dollar+ "&bankCode=" + bankCode + "&rate=" + jiaoYiRate;
               	           	window.open(redirectUrl);
               	        	
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
