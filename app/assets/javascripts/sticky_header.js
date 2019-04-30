$(function() {

    // スクロールイベント発生
    $(window).on('scroll', function() {
  
      // 下方向へ100スクロールしたら
      if($(window).scrollTop() > 100) {
        $('.nav-bg').removeClass('bg-hidden');
        $('.nav-bg').addClass('bg-visible');
        $('header').addClass('header-animation');
        $('.logo').addClass('logo-animation');
      } else {
        $('.nav-bg').removeClass('bg-visible');
        $('.nav-bg').addClass('bg-hidden');
        $('header').removeClass('header-animation');
        $('.logo').removeClass('logo-animation');
      }
  
    });
  });