define(['jquery'], function($) {
  var Tabs = function() {
    this.current = 0;
  };

  Tabs.prototype.init = function() {
    var $tabs = $('.tabs');
    var $tabControls = $tabs.find('.tab-control-item');
    var $tabContents = $('.tab-content');
    var tabContentCls = 'tab-content';

    $tabControls
      .eq(this.current)
      .addClass('active')
      .siblings()
      .removeClass('active');

    $tabContents
      .eq(this.current)
      .show()
      .siblings('.tab-content')
      .hide();

    $tabControls.click(function(e) {
      var $this = $(this);

      if ($this.hasClass('active')) {
        return false;
      } else {
        var target = $this.data('target');

        if (target) {
          e.preventDefault();

          $this
            .addClass('active')
            .siblings()
            .removeClass('active');

          $('.' + tabContentCls + '.' + target)
            .show()
            .siblings()
            .hide();
        }
      }
    });
  };

  var tabs = new Tabs();
  return tabs;
});
