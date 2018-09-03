$(function() {
  var $userNameInput = $('#userName');
  var $mobileInput = $('#mobile');
  var $subbranchInput = $('#subbranch');
  var $form = $('#form');
  var mobileReg = /^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/;
  var $tips = $('.tips');

  var $body = $('body');
  let top = 0;

  var stopBodyScroll = function(isFixed) {
    if (isFixed) {
      top = window.scrollY;

      $body.css({
        position: 'fixed',
        top: -top + 'px',
        left: 0,
        right: 0
      });
    } else {
      $body.css({
        position: '',
        top: ''
      });
      window.scrollTo(0, top); // 回到原先的top
    }
  };

  $userNameInput
    .on('focus', function() {
      stopBodyScroll(true);
    })
    .on('blur', function() {
      stopBodyScroll(false);
    });

  $mobileInput
    .on('focus', function() {
      stopBodyScroll(true);
    })
    .on('blur', function() {
      stopBodyScroll(false);
    });

  $(document).on('touchstart', function(e) {
    var $target = $(e.target);

    if (!$target.is('input')) {
      $userNameInput.blur();
      $mobileInput.blur();
    }
  });

  var subbranchArr = [
    '东城球迷会',
    '西城球迷会',
    '朝阳球迷会',
    '丰台球迷会',
    '石景山球迷会',
    '海淀球迷会',
    '中关村球迷会',
    '望京球迷会',
    '金融街球迷会'
  ];

  var tips = function(text) {
    $tips.hide();
    $tips
      .html(text)
      .stop()
      .fadeIn(120)
      .delay(1500)
      .fadeOut(120);
  };

  var selectSubbranch = new MobileSelect({
    trigger: '#subbranch',
    title: '',
    wheels: [{ data: subbranchArr }],
    position: [0], //初始化定位
    callback: function(indexArr, data) {
      $subbranchInput.val(data[0]);
    },
    onShow: function() {
      stopBodyScroll(true);
    },
    onHide: function() {
      stopBodyScroll(false);
    }
  });

  $form.submit(function(e) {
    e.preventDefault();

    var userName = $userNameInput.val().trim();
    var mobile = $mobileInput.val().trim();
    var subBranch = $subbranchInput.val().trim();

    if (!userName) {
      tips('请输入您的真实姓名');
      return;
    } else if (!mobile) {
      tips('请输入您的手机号码');
      return;
    } else if (!mobileReg.test(mobile)) {
      tips('请输入合法的手机号码');
      return;
    } else if (!subBranch) {
      tips('请选择所在球迷会');
      return;
    }

    $.ajax({
      url: '/service/business/userrecord/save',
      method: 'POST',
      data: {
        user_name: userName,
        mobile: mobile,
        subBranch: subBranch
      },
      success: function(resp) {
        if (resp.resultCode === 0) {
          tips('提交成功，感谢您的参与');

          $userNameInput.val('');
          $mobileInput.val('');
          $subbranchInput.val('');
        } else {
          tips(resp.resultMessage);
        }
      }
    });
  });
});
