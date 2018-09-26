require(['js/require-config'], function() {
  require(['jquery', 'Clipboard', 'weui'], function($, Clipboard) {
    var clipboard = new Clipboard('#copyBtn');

    clipboard.on('success', function(e) {
      $.toast('复制成功');
    });
  });
});
