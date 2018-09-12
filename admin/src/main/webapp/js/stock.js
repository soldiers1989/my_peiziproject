require(['js/require-config'], function() {
  require(['jquery', 'Qs', 'layer'], function($, Qs, layer) {
    $(function() {
      var $marginInput = $('#marginInput');
      var $multipleSelect = $('#multipleSelect');
      var $tradeTimesSelect = $('#tradeTimesSelect');
      var $startDateRadio = $('[name="startDate"]');

      var $total = $('#total');
      var $tradeTimes = $('#tradeTimes');
      var $lossLine = $('#lossLine');
      var $closeLine = $('#closeLine');
      var $rate = $('#rate');
      var $funds = $('#funds');
      var $marginAmount = $('#marginAmount');
      var $interestAmount = $('#interestAmount');
      var $prepareFunds = $('#prepareFundsAmount');
      var $stockBtn = $('#stockBtn');

      /**
       * 配资
       * @param {string} type 类型： free 免息 day 按天 month 按月
       */
      var Stock = function(type) {
        this.type = type;
        this.data = {
          free: {
            // 保证金
            margin: 1000,
            // 倍数
            multiple: 1,
            // 操盘天数
            tradeTimes: 30,
            // 总操盘资金
            total: 0,
            lossLine: 0,
            closeLine: 0,
            startDate: 1,
            rate: 0,
            // 获取资金
            funds: 1000,
            // 利息总额
            interest: 4,
            // 准备总资金
            prepareFunds: 1004
          },
          day: {
            // 保证金
            margin: 1000,
            // 倍数
            multiple: 1,
            // 操盘天数
            tradeTimes: 2,
            // 总操盘资金
            total: 0,
            // 亏损警戒线
            lossLine: 0,
            // 平仓线
            closeLine: 0,
            // 交易时间
            startDate: 1,
            // 利率
            rate: 0.05,
            // 获取资金
            funds: 1000,
            // 利息总额
            interest: 4,
            // 准备总资金
            prepareFunds: 1004
          },
          month: {
            // 保证金
            margin: 1000,
            // 倍数
            multiple: 1,
            // 操盘月份
            tradeTimes: 1,
            // 总操盘资金
            total: 0,
            // 亏损警戒线
            lossLine: 0,
            // 平仓线
            closeLine: 0,
            // 交易时间
            startDate: 1,
            // 利率
            rate: 0.8,
            // 获取资金
            funds: 1000,
            // 利息总额
            interest: 4,
            // 准备总资金
            prepareFunds: 1004
          }
        };
      };

      Stock.prototype.init = function() {
        this.calculate().render();
        this.fieldListener();
      };

      Stock.prototype.fieldListener = function() {
        var _this = this;
        var type = this.type;

        // 监听选择杠杆率下拉change
        $multipleSelect.change(function(e) {
          var $this = $(this);
          var value = e.target.value;

          _this.data[type].multiple = +value;

          if (type === 'day' || type === 'month') {
            _this.data[type].rate = $this.find('option:selected').data('rate');
          }

          _this.calculate().render();
        });

        // 保证金输入框 失去焦点
        $marginInput.blur(function(e) {
          var value = e.target.value;
          var $this = $(this);

          if (isNaN(parseInt(value))) {
            layer.msg('保证金必须为1000的倍数，请重新输入');
            $this.val(1000);
            return;
          } else if (parseInt(value) % 1000 !== 0) {
            layer.msg('保证金必须为1000的倍数，请重新输入');
            $this.val(1000);
          } else {
            _this.data[type].margin = +parseInt(value);
            _this.calculate().render();
          }

          console.log(e.target.value);
        });

        // 交易时间
        $startDateRadio.change(function() {
          var $this = $(this);

          _this.data[type].startDate = +$this.val();
          console.log(_this.data[type]);
        });

        // 操盘天数
        $tradeTimesSelect.change(function(e) {
          _this.data[type].tradeTimes = +e.target.value;
          _this.calculate().render();
        });

        // 我要配资按钮跳转对应页面，添加参数

        $stockBtn.click(function(e) {
          e.preventDefault();
          var stockEnterUrl = './stock-enter.html';
          var type = _this.type;
          var margin = _this.data[type].margin;
          var multiple = _this.data[type].multiple;
          var tradeTimes = _this.data[type].tradeTimes;
          var startDate = _this.data[type].startDate;
          var sType;
          switch (type) {
            case 'free':
              sType = 1;
              break;
            case 'day':
              sType = 2;
              break;
            case 'month':
              sType = 3;
              break;

            default:
              sType = null;
              break;
          }

          var query = Qs.stringify({
            type: sType,
            margin: margin,
            multiple: multiple,
            tradeTimes: tradeTimes,
            startDate: startDate
          });

          window.location.href = stockEnterUrl + '?' + query;
        });
      };

      Stock.prototype.render = function() {
        var type = this.type;
        var data = this.data[type];
        console.log(data);

        $tradeTimesSelect.val(data.tradeTimes);
        $total.text(data.total);
        $tradeTimes.text(data.tradeTimes);
        $lossLine.text(data.lossLine);
        $closeLine.text(data.closeLine);

        $rate.text(data.rate);
        $funds.text(data.funds);
        $marginAmount.text(data.margin);
        $interestAmount.text(data.interest);
        $prepareFunds.text(data.prepareFunds);

        return this;
      };

      Stock.prototype.calculate = function() {
        var type = this.type;
        var margin = this.data[type].margin;
        var rate = this.data[type].rate;
        var tradeTimes = this.data[type].tradeTimes;
        var multiple = this.data[type].multiple;
        var interest = this.data[type].margin * (rate / 100) * tradeTimes;

        var total = margin * (multiple + 1);
        var lossLine = margin * multiple + margin * 0.05;
        var closeLine = margin * multiple + margin * 0.03;
        var funds = margin * multiple;
        var prepareFunds = margin + ((margin * rate) / 100) * tradeTimes;

        this.data[type].total = total;
        this.data[type].lossLine = lossLine;
        this.data[type].closeLine = closeLine;
        this.data[type].funds = funds;
        this.data[type].interest = interest;
        this.data[type].prepareFunds = prepareFunds;

        return this;
      };

      var type = $('#stock').data('type');
      var stock = new Stock(type);

      stock.init();
    });
  });
});
