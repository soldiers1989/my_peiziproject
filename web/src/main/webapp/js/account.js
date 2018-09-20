require(['js/require-config'], function() {
  require(['jquery', 'Swiper'], function($, Swiper) {
    $(function() {
      // 轮播图
      if ($('.swiper-container').length) {
        new Swiper('.swiper-container', {
          pagination: '.swiper-pagination',
          autoplay: 3000
        });
      }
    });
  });
});
