var selectedChar = null;
var WelcomePercentage = "30vh"
MultiChar = {}
var Loaded = false;
var Steam = null

$(document).ready(function() {
  window.addEventListener('message', function(event) {
    var data = event.data;

    if (data.action == "ui") {
      if (data.toggle) {
        $('.containerMC').show();
        $(".welcomescreen").fadeIn(150);
        MultiChar.resetAll();

        var originalText = "Loading DokusCore";
        var loadingProgress = 0;
        var loadingDots = 0;
        $("#loading-text").html(originalText);
        var DotsInterval = setInterval(function() {
          $("#loading-text").append(".");
          loadingDots++;
          loadingProgress++;
          if (loadingProgress == 3) {
            originalText = "Connecting DokusCore"
            $("#loading-text").html(originalText);
          }
          if (loadingProgress == 4) {
            originalText = "Connected to DokusCore"
            $("#loading-text").html(originalText);
          }
          if (loadingProgress == 6) {
            originalText = "Validating Character Data"
            $("#loading-text").html(originalText);
          }
          if (loadingDots == 4) {
            $("#loading-text").html(originalText);
            loadingDots = 0;
          }
        }, 500);
        setTimeout(function() {
          $.post('http://DokusCore--MultiCharacters/setupCharacters');
          setTimeout(function() {
            clearInterval(DotsInterval);
            loadingProgress = 0;
            originalText = "Loading Data";
            $(".welcomescreen").fadeOut(150);
            MultiChar.fadeInDown('.character-info', '20%', 400);
            MultiChar.fadeInDown('.characters-list', '25%', 400);
            $.post('http://DokusCore--MultiCharacters/removeBlur');
          }, 2000);
        }, 2000);
      } else {
        $('.containerMC').fadeOut(250);
        MultiChar.resetAll();
      }
    }

    if (data.action == "setupCharacters") {
      setupCharacters(event.data.characters)
    }

    if (data.action == "SetupSteam") {
      Steam = event.data.value
    }
  });
  $('.datepicker').datepicker();
});

function setupCharacters(characters) {
  $.each(characters, function(index, char) {
    Steam = char.Steam
    $('#char-' + char.CharID).html("");
    $('#char-' + char.CharID).data("citizenid", char.CharID);
    setTimeout(function() {
      $('#char-' + char.CharID).html('<span id="slot-name">' + char.cName + '<span id="cid">' + char.CharID + '</span></span>');
      $('#char-' + char.CharID).data('cData', char)
      $('#char-' + char.CharID).data('cid', char.CharID)
    }, 100)
  })
}

$(document).on('click', '.character', function(e) {
  var cDataPed = $(this).data('cData');
  e.preventDefault();
  if (selectedChar === null) {
    selectedChar = $(this);
    if ((selectedChar).data('cid') == "") {
      $(selectedChar).addClass("char-selected");
      $("#play-text").html("Create");
      $("#play").css({
        "display": "block"
      });
      $("#delete").css({
        "display": "none"
      });
      $.post('http://DokusCore--MultiCharacters/cDataPed', JSON.stringify({
        cData: cDataPed
      }));
    } else {
      $(selectedChar).addClass("char-selected");
      $("#play-text").html("Play");
      $("#delete-text").html("Delete");
      $("#play").css({
        "display": "block"
      });
      $("#delete").css({
        "display": "block"
      });
      $.post('http://DokusCore--MultiCharacters/cDataPed', JSON.stringify({
        cData: cDataPed
      }));
    }
  } else if ($(selectedChar).attr('id') !== $(this).attr('id')) {
    $(selectedChar).removeClass("char-selected");
    selectedChar = $(this);
    if ((selectedChar).data('cid') == "") {
      $(selectedChar).addClass("char-selected");
      $("#play-text").html("Create");
      $("#play").css({
        "display": "block"
      });
      $("#delete").css({
        "display": "none"
      });
      $.post('http://DokusCore--MultiCharacters/cDataPed', JSON.stringify({
        cData: cDataPed
      }));
    } else {
      $(selectedChar).addClass("char-selected");
      $("#play-text").html("Play");
      $("#delete-text").html("Delete");
      $("#play").css({
        "display": "block"
      });
      $("#delete").css({
        "display": "block"
      });
      $.post('http://DokusCore--MultiCharacters/cDataPed', JSON.stringify({
        cData: cDataPed
      }));
    }
  }
});

$(document).on('click', '#create', function(e) {
  e.preventDefault();
  $.post('http://DokusCore--MultiCharacters/createNewCharacter', JSON.stringify({
    Steam: Steam,
    Firstname: $('#first_name').val(),
    Lastname: $('#last_name').val(),
    Nationality: $('#nationality').val(),
    Birthdate: $('#birthdate').val(),
    Gender: $('select[name=gender]').val(),
    CharID: $(selectedChar).attr('id').replace('char-', ''),
  }));
  $(".containerMC").fadeOut(150);
  $('.characters-list').css("filter", "none");
  $('.character-info').css("filter", "none");
  MultiChar.fadeOutDown('.character-register', '125%', 400);
  refreshCharacters()
});

$(document).on('click', '#accept-delete', function(e) {
  $.post('http://DokusCore--MultiCharacters/removeCharacter', JSON.stringify({
    Steam: Steam,
    CharID: $(selectedChar).data("citizenid"),
  }));
  $('.character-delete').fadeOut(150);
  $('.characters-block').css("filter", "none");
  refreshCharacters()
});

function refreshCharacters() {
  $('.characters-list').html('<div class="character" id="char-1" data-cid=""><span id="slot-name">Empty Character Slot<span id="cid"></span></span></div><div class="character" id="char-2" data-cid=""><span id="slot-name">Empty Character Slot<span id="cid"></span></span></div><div class="character" id="char-3" data-cid=""><span id="slot-name">Empty Character Slot<span id="cid"></span></span></div><div class="character" id="char-4" data-cid=""><span id="slot-name">Empty Character Slot<span id="cid"></span></span></div><div class="character" id="char-5" data-cid=""><span id="slot-name">Empty Character Slot<span id="cid"></span></span></div><div class="character-btn" id="play"><p id="play-text">Select a character</p></div><div class="character-btn" id="delete"><p id="delete-text">Select a character</p></div>')
  setTimeout(function() {
    $(selectedChar).removeClass("char-selected");
    selectedChar = null;
    $.post('http://DokusCore--MultiCharacters/setupCharacters');
    $("#delete").css({
      "display": "none"
    });
    $("#play").css({
      "display": "none"
    });
    MultiChar.resetAll();
  }, 100)
}

$("#close-reg").click(function(e) {
  e.preventDefault();
  $('.characters-list').css("filter", "none")
  $('.character-info').css("filter", "none")
  MultiChar.fadeOutDown('.character-register', '125%', 400);
})

$("#close-del").click(function(e) {
  e.preventDefault();
  $('.characters-block').css("filter", "none");
  $('.character-delete').fadeOut(150);
})

$(document).on('click', '#play', function(e) {
  e.preventDefault();
  var charData = $(selectedChar).data('cid');

  if (selectedChar !== null) {
    if (charData !== "") {
      $.post('http://DokusCore--MultiCharacters/selectCharacter', JSON.stringify({
        cData: $(selectedChar).data('cData')
      }));
      setTimeout(function() {
        MultiChar.fadeOutDown('.characters-list', "-40%", 400);
        MultiChar.fadeOutDown('.character-info', "-40%", 400);
        MultiChar.resetAll();
      }, 1500);
    } else {
      $('.characters-list').css("filter", "blur(2px)")
      $('.character-info').css("filter", "blur(2px)")
      MultiChar.fadeInDown('.character-register', '25%', 400);
    }
  }
});

$(document).on('click', '#delete', function(e) {
  e.preventDefault();
  var charData = $(selectedChar).data('cid');

  if (selectedChar !== null) {
    if (charData !== "") {
      $('.characters-block').css("filter", "blur(2px)")
      $('.character-delete').fadeIn(250);
    }
  }
});

MultiChar.fadeOutUp = function(element, time) {
  $(element).css({
    "display": "block"
  }).animate({
    top: "-80.5%",
  }, time, function() {
    $(element).css({
      "display": "none"
    });
  });
}

MultiChar.fadeOutDown = function(element, percent, time) {
  if (percent !== undefined) {
    $(element).css({
      "display": "block"
    }).animate({
      top: percent,
    }, time, function() {
      $(element).css({
        "display": "none"
      });
    });
  } else {
    $(element).css({
      "display": "block"
    }).animate({
      top: "103.5%",
    }, time, function() {
      $(element).css({
        "display": "none"
      });
    });
  }
}

MultiChar.fadeInDown = function(element, percent, time) {
  $(element).css({
    "display": "block"
  }).animate({
    top: percent,
  }, time);
}

MultiChar.resetAll = function() {
  $('.characters-list').hide();
  $('.characters-list').css("top", "-40");
  $('.character-info').hide();
  $('.character-info').css("top", "-40");
  // $('.welcomescreen').show();
  $('.welcomescreen').css("top", WelcomePercentage);
  $('.server-log').show();
  $('.server-log').css("top", "25%");
}
