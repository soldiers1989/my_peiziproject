require(['js/require-config'], function() {
  require(['jquery', 'Swiper', 'countUp'], function($, Swiper, CountUp) {
    $(function() {
      // 轮播图
      if ($('.swiper-container').length) {
        new Swiper('.swiper-container', {
          pagination: '.swiper-pagination',
          paginationClickable: true,
          autoplay: 3000,
          loop: true
        });
      }

      // 数字滚动
      var $strongs = $('.data-preview').find('strong');
      var options = {
        useEasing: true,
        useGrouping: true,
        separator: ',',
        decimal: '.'
      };

      for (var index = 1; index < $strongs.length + 1; index++) {
        var element = document.getElementById('countUp' + index);
        var demo = new CountUp(
          'countUp' + index,
          0,
          element.getAttribute('data-num'),
          0,
          2.5,
          options
        );
        if (!demo.error) {
          demo.start();
        } else {
          console.error(demo.error);
        }
      }

      // 用户
      var $userBox = $('.users-box');
      var $childDiv = $userBox.find('div');
      var timer = null;

      timer = setInterval(function() {
        $childDiv.animate(
          {
            marginTop:
              -$childDiv
                .find('p')
                .eq(0)
                .height() + 'px'
          },
          300,
          function() {
            var $firstUser = $childDiv.find('p').eq(0);
            $firstUser.appendTo($childDiv);
            $childDiv.css({
              marginTop: 0
            });
          }
        );
      }, 1000);

      // 合作伙伴/友情链接切换
      var $indexTabLinks = $('.index-tab').find('a');
      var $partner = $('#partner');
      var $links = $('#links');

      $indexTabLinks.click(function(e) {
        var $this = $(this);
        var href = $this.attr('href');

        e.preventDefault();

        $this
          .addClass('active')
          .siblings('a')
          .removeClass('active');

        $(href)
          .show()
          .siblings()
          .hide();
      });
    });
  });
});
