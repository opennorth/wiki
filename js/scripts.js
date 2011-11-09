$(function () {
  var scroller;
  $('html,body').each(function () {
    var element = $(this);
    if (element.scrollTop() > 0) {
      scroller = element;
    }
    else {
      element.scrollTop(1);
      var test = element.scrollTop() > 0;
      element.scrollTop(0);
      if (test) {
        scroller = element;
      }
    }
  });
  $('a.back').click(function (event) {
    scroller.animate({scrollTop: 0}, 700);
    event.preventDefault();
  });
    
  $('#slider').fadeIn(300).nivoSlider({
    effect: 'fold',
    pauseTime: 5000,
    directionNavHide: false
  });
    
  /*
  $('#tweets').getTwitter({
    userName: 'opennorth',
    showHeading: false,
    showProfileLink: false
  });
  */
});
