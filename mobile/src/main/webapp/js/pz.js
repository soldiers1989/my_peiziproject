require(['js/require-config'], function() {
  require(['jquery', 'utils', 'Qs', 'weui'], function($, utils, Qs) {
    $(function() {
      // 保证金输入框
      var $marginInput = $('#margin');
      // 杠杆率选择
      var $leverageSelect = $('#leverage');
      // 操盘期限选择
      var $deadlineSelect = $('#deadline');
      // 利息数字
      var $interest = $('#interest');
      // 利息公式
      var $interestFormula = $('#interestFormula');
      // 准备资金公式
      var $prepareFundsFormula = $('#prepareFundsFormula');
      // 总操盘金额
      var $totalTradingAmount = $('#totalTradingAmount');
      // 准备资金
      var $prepareFunds = $('#prepareFunds');
      // 预警线
      var $warningAmount = $('#warningAmount');
      // 平仓线
      var $closeAmount = $('#closeAmount');
      var $startDate = $('#startDate');
      var $btn = $('.weui-btn');

      /**
       * 配资方式， free、day、month
       * @param {*} type
       */
      var Pz = function(type) {
        this.type = type;
        this.margin = 1000;

        this.leverage = 1;
        this.closeProportion = type === 'month' ? 0.2 : 0.3;

        this.startDate = 1;

        switch (type) {
          case 'day':
            this.leverage = 1;
            this.deadline = 2;
            this.rate = 0.05;
            break;
          case 'month':
            this.leverage = 1;
            this.rate = 0.8;
            this.deadline = 1;
            break;
          case 'free':
            this.leverage = 1;
            this.margin = 1000;
            this.deadline = 30;
            break;
          default:
            this.leverage = null;
        }
      };

      /**
       * 初始化， 监听用户输入，选择时事件
       */

      Pz.prototype.init = function() {
        this.calculate();
        $marginInput.on(
          'blur',
          function() {
            var $this = $(this);
            var value = $marginInput.val().trim();
            if (parseInt(value) < 1000) {
              $marginInput.val('1000');
              utils.errorToast('保证金应大于1000');
            } else if (value % 1000 !== 0) {
              $marginInput.val('1000');
              utils.errorToast('保证金应为1000的倍数');
            } else {
              this.margin = value;
            }

            this.calculate();
          }.bind(this)
        );
        $leverageSelect.change(
          function() {
            if (this.type === 'month') {
              this.rate = $leverageSelect.find('option:selected').data('rate');
            } else {
              this.rate = null;
            }
            this.leverage = $leverageSelect.val();
            this.calculate();
          }.bind(this)
        );
        $deadlineSelect.change(
          function() {
            this.deadline = $deadlineSelect.val();
            console.log(this);
            this.calculate();
          }.bind(this)
        );

        $startDate.change(
          function() {
            var $this = $(this);
            this.startDate = $startDate.val();
          }.bind(this)
        );

        $btn.click(
          function() {
            console.log(this.type);
            var search = Qs.stringify({
              type: this.type,
              margin: this.margin,
              multiple: this.leverage,
              deadline: this.deadline,
              startDate: this.startDate,
              rate:$interest.text(),
              caopanAmount:$totalTradingAmount.text(),
              warnLine:$warningAmount.text(),
              pingcangLine:$closeAmount.text()
            });
            window.location.href = './stock-enter.jsp?' + search;
          }.bind(this)
        );
      };

      /**
       * 计算利息、总操盘金额、准备资金、预警线、平仓线
       */
      Pz.prototype.calculate = function() {
        // 计算利息
        // 按天配资
        var interest = (
          this.margin *
          this.leverage *
          0.0005 *
          this.deadline
        ).toFixed(2);

        // 按月配资
        if (this.type === 'month') {
          interest = (this.rate * this.margin * this.leverage * 0.01).toFixed(
            2
          );
        }
        var totalTradingAmount = Math.floor(this.margin * (+this.leverage + 1));
        var prepareFunds = (+this.margin + +interest).toFixed(2);
        var warningAmount = parseInt(
          +this.margin * parseInt(this.leverage) * 1.05
        );
        var closeAmount = parseInt(
          +this.margin * parseInt(this.leverage) * 1.03
        );

        if (this.type === 'free') {
          totalTradingAmount = this.margin * (+this.leverage + 1);
        }
        this.render(
          interest,
          totalTradingAmount,
          prepareFunds,
          warningAmount,
          closeAmount
        );
      };

      /**
       *
       * 根据计算结果渲染到页面
       * @param {*} interest 利息
       * @param {*} totalTrdingAmount 总操盘金额
       * @param {*} prepareFunds 准备资金
       * @param {*} warningAmount 预警线
       * @param {*} closeAmount  平仓线
       */
      Pz.prototype.render = function(
        interest,
        totalTrdingAmount,
        prepareFunds,
        warningAmount,
        closeAmount
      ) {
        $interest.text(interest);
        $totalTradingAmount.text(totalTrdingAmount);
        $prepareFunds.text(prepareFunds);
        $warningAmount.text(warningAmount);
        $closeAmount.text(closeAmount);
        if (this.type === 'month') {
          $interestFormula.text(
            this.margin + ' x ' + this.leverage + ' x ' + this.rate + '%'
          );
        } else if (this.type === 'day') {
          $interestFormula.text(
            this.margin +
              ' x ' +
              this.leverage +
              ' x ' +
              '0.05%' +
              ' x ' +
              this.deadline +
              '天'
          );
        }
        $prepareFundsFormula.text(
          this.margin + '保证金' + ' + ' + interest + '元利息'
        );
      };

      var type = $('body').data('type');
      if (type) {
        new Pz(type).init();
      } else {
        throw new Error('未找到body上面的data-type属性');
      }
    });
  });
});
