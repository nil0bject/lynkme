$(document).ready(function() {$('.login input#password_confirmation').parent().hide()
  $('.login h3.register').click(function() {
    $('.login input#password_confirmation').parent().fadeIn()
    $('.login .actions input').val('Register')
  });
});