require(['js/require-config'], function() {
  require(['jquery', 'Qs', 'layer'], function($, Qs, layer) {
    var unit, margin, interest;
    var search = window.location.search;
    var query = Qs.parse(search.replace('?', ''));
    var $stockTitle = $('#stockTitle');
    var $unit = $('.unit');

    if (search.indexOf('?') === -1) {
      layer.alert('您所访问的网址有误');
      setTimeout(function() {
        window.location.href = './';
      }, 1500);
    }

    if (typeof query === 'object') {
      for (const k in query) {
        if (query.hasOwnProperty(k)) {
          const item = query[k];
          if (!item) {
            layer.alert('您所访问的网址有误');
            setTimeout(function() {
              window.location.href = './';
            }, 1500);
          }
        }
      }
    } else {
      layer.alert('您所访问的网址有误');
      setTimeout(function() {
        window.location.href = './';
      }, 1500);
    }

    var StockEnter = function() {
      this.query = Qs.parse(query);
      this.type = +query.type;
      console.log(this.type);
      this.rate = 0;
      this.stockTitle = '免息配资';
      this.unit = '天';
      this.margin = +query.margin;
      this.multiple = +query.multiple;
      this.tradeTimes = +query.tradeTimes;

      switch (this.type) {
        case 2:
          this.rate = 0.0005;
          this.stockTitle = '按天配资';
          break;
        case 3:
          this.rate = 0.008;
          this.unit = '月';
          this.stockTitle = '按月配资';
          break;

        default:
          this.rate = 0;
          break;
      }
    };

    StockEnter.prototype.init = function() {
      this.render();
    };

    StockEnter.prototype.render = function() {
      var balance = +$('.balance').text();

      if (this.type === 1) {
        $('.precautions-list.free').show();

        $('.prefix').hide();
      } else if (this.type === 2) {
        $('.precautions-list.day').show();
        $('.prefix').hide();
      } else {
        $('.precautions-list.month').show();
        $('.prefix').show();
      }

      var interest = this.margin * this.rate * this.multiple * this.tradeTimes;

      $('.unit').text(this.unit);
      $('#stockTitle').text(this.stockTitle);
      $('.margin').text(this.margin);
      $('.trade-times-span').text(this.tradeTimes);
      $('.interest-unit').text(this.margin * this.rate * this.multiple);
      $('.interest').text(interest);
      $('.total').text(this.margin * this.multiple);
      $('.total-amount').text(this.margin + this.margin * this.multiple);
      $('.warning-line').text(this.margin * this.multiple * 1.05);
      $('.close-line').text(this.margin * this.multiple * 1.03);

      $('.recharge-amount').text(interest - balance);
    };

    var stockEnter = new StockEnter();

    stockEnter.init();
  });
});
