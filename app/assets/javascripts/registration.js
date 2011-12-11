$(document).ready(function() {$('.login input#password_confirmation').parent().hide()
  $('.login .register a').click(function() {
    $('.login .register').hide();
    $('.login input#password_confirmation').parent().fadeIn()
    $('.login .actions input').val('Register')
  });
});