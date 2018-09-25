require(['js/require-config'], function() {
  require(['jquery', 'utils', 'weui'], function($, utils) {
    $(function() {
      var $submitBtn = $('#submitBtn');
      var $nameInput = $('#name');
      var $codeInput = $('#code');
      var $accountInput = $('#account');
      $submitBtn.click(function() {
        var name = $nameInput.val().trim();
        var code = $codeInput.val().trim();
        var account = $accountInput.val();
        if (name === '') {
          utils.errorToast('请输入真实姓名');
        } else if (code === '') {
          utils.errorToast('请输入身份证号');
        } else {
          $.ajax({
            url: '/service/web/user/centauth',
            method: 'POST',
            data: {
            	realName: name,
            	codeNumber: code,
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
