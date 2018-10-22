require(['js/require-config'], function() {
  require(['jquery', 'Clipboard', 'layer'], function($, Clipboard, layer) {
    var copyboard = new Clipboard('#copyBtn');

    copyboard.on('success', function() {
      layer.msg('复制成功');
    });
  });
});
