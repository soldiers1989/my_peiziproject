require(['js/require-config'], function() {
  require(['jquery', 'utils', 'weui'], function($, utils) {
    $(function() {
      var $submitBtn = $('#submitBtn');
      var $nameInput = $('#name');
      var $codeInput = $('#code');

      $submitBtn.click(function() {
        var name = $nameInput.val().trim();
        var code = $codeInput.val().trim();

        if (name === '') {
          utils.errorToast('请输入真实姓名');
        } else if (code === '') {
          utils.errorToast('请输入身份证号');
        } else {
          $.ajax({
            url: '',
            method: 'POST',
            data: {
              name: name,
              code: code
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
