$(document).ready(function() {
  $("body").fadeOut(0);

  window.addEventListener('message', function(event) {});

  $(function PassData() {
    $.post('https://DokusCore--SpecialAccess/PassData');
  });

});
