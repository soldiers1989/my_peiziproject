require(['js/require-config'], function() {
  require(['jquery', 'utils', 'Qs'], function($, utils, Qs) {
    var queryStr = window.location.search.replace('?', '');
    var query = Qs.parse(queryStr);
    var $total = $('#total');
    var $margin = $('#margin');
    var $interest = $('#interest');
    var $deadline = $('#deadline');

    var rate = 0;
    var unit = '天';

    if (query.type === 'day') {
      rate = 0.0005;
    } else if (query.type === 'month') {
      rate = 0.008;
      unit = '个月';
    }

    var margin = +query.margin;
    var interest = margin * +query.deadline * rate * +query.multiple;
    var total = margin + interest;
    var deadline = query.deadline + unit;

    $margin.text(margin);
    $interest.text(interest);
    $total.text(total);
    $deadline.text(deadline);
  });
});
