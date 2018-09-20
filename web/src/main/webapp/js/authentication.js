require(['js/require-config'], function() {
  require(['jquery', 'utils', 'layer'], function($, utils, layer) {
    $(function() {
      var $realNameInput = $('#realName');
      var $codeNumberInput = $('#codeNumber');
      var $submitBtn = $('#submitBtn');

      $submitBtn.click(function() {
        var realName = $realNameInput.val().trim();
        var codeNumber = $codeNumberInput.val().trim();

        if (realName === '') {
          layer.msg('请输入您的真实姓名');
        } else if (codeNumber === '') {
          layer.msg('请输入真实身份证号码');
        } else {
          $.ajax({
            url: '',
            data: {
              realName: realName,
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
