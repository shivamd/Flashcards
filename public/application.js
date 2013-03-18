$(document).ready(function() {
  $('.start-location').focus();

  $('.apple-logo').click(function() {
    $('.menu-user').toggle();
    $(this).toggleClass('apple');
  });
});