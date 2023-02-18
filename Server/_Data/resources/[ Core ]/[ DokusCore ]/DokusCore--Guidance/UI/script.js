$(document).ready(function() {
  $("body").fadeOut(0);

  window.addEventListener('message', function(event) {
    var Action = event.data.Action
    var Link   = event.data.Link
    if (Action == 'SetLink') { document.getElementById("SetLink").src = Link; };
    if (Action == "Show") { $("body").fadeIn(500); };
    if (Action == "Hide") { $("body").fadeOut(500); };
  });

  $(function () {
    document.onkeyup = function (data) {
      if (open) {
        if (data.which == 27) {
          close()
          $.post('https://DokusCore--Guidance/close');
        }
      }
    };
  });


  $(function close() {
    $.post('https://DokusCore--Guidance/close');
    $("body").fadeOut(500);
  });

});
