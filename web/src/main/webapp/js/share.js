require(['js/require-config'], function() {
  require(['jquery', 'Clipboard'], function($, Clipboard) {
    new Clipboard('#copyBtn');
  });
});
