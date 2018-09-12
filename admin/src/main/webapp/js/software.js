require(['js/require-config'], function() {
  require(['jquery', 'Swiper'], function($, Swiper) {
    $(function() {
      var $links = $('#downloadLinks').find('a');

      $links.hover(
        function() {
          var $qrCode = $(this).children('.app-qrcode');
          if ($qrCode.length) {
            $qrCode.stop().fadeIn();
          }
        },
        function() {
          var $qrCode = $(this).children('.app-qrcode');
          if ($qrCode.length) {
            $qrCode.stop().fadeOut();
          }
        }
      );
    });
  });
});
